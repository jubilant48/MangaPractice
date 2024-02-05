//
//  FilterCollapsibleView.swift
//  EMSwiftUI
//
//  Created by macbook on 05.02.2024.
//

import SwiftUI

// MARK: - Constant

extension FilterCollapsibleView {
    struct Constant {
        let fontRegular = FontFamily.SFProText.regular
        let fontRegularSize: CGFloat = 20
        
        let black = Asset.Colors.blackBase.swiftUIColor
        
        let padding: CGFloat = 16
        let largePadding: CGFloat = 24
    }
}

struct FilterCollapsibleView: View {
    // MARK: - Attributes
    
    @Binding var selectedDict: [String: Bool]
    var section: FilterSectionModel
    @Binding var sections: [FilterSectionModel: [String: Bool]]
    
    @State private var isExpensed: Bool = false
    
    private let constant = Constant()
    
    var body: some View {
        VStack {
            HStack {
                Text(section.asTitle)
                
                Image(systemName: isExpensed ? "chevron.up" : "chevron.down")
                
                Spacer()
            }
            .font(
                .custom(constant.fontRegular,
                        size: constant.fontRegularSize)
            )
            .foregroundColor(constant.black)
            .onTapGesture {
                withAnimation() {
                    isExpensed.toggle()
                }
            }
            .animation(.default, value: UUID())
            
            if isExpensed {
                FlowLayout(mode: .scrollable, items: getTitles()) { title in
                    FilterSingleView(isSelected: self.bunding(for: title), title: title) {
                        if getIsSelected(for: title) {
                            self.selectedDict[title] = getIsSelected(for: title)
                        } else {
                            withAnimation(.linear(duration: 0.01)) {
                                self.selectedDict[title] = nil
                            }
                        }
                    }
                        .padding([.trailing, .bottom], constant.padding)
                }
                .padding(.top, constant.padding)
                .frame(height: self.isExpensed ? nil : 0)
                .animation(.default, value: UUID())
                .transition(.opacity)
            }
            
        }
        .padding(.bottom, isExpensed ? 0 : constant.largePadding )
    }
    
    // MARK: - Methods
    
    private func bunding(for key: String) -> Binding<Bool> {
        return .init(
            get: { self.sections[section]![key, default: false] },
            set: { self.sections[section]![key] = $0 }
        )
    }
    
    private func getTitles() -> [String] {
        guard let tags = sections[section] else { return [] }
        
        return tags.keys.sorted()
    }
    
    private func getIsSelected(for key: String) -> Bool {
        guard let isSelected = sections[section]?[key] else { return false }
        
        return isSelected
    }
    
}
