//
//  FilterSelectionView.swift
//  EMSwiftUI
//
//  Created by macbook on 04.02.2024.
//

import SwiftUI

// MARK: - Constant

extension FilterSelectionView {
    struct Constant {
        let title: String = "Selection"
        
        let fonBold = FontFamily.SFProText.bold
        let fontBoldSize: CGFloat = 20
        
        let buttonPadding: CGFloat = 24
        
        let gray = Asset.Colors.whiteStar.swiftUIColor
    }
}

struct FilterSelectionView: View {
    // MARK: - Attributes
    
    @Binding var selectionDict: [String: Bool]
    @Binding var sections: [FilterSectionModel: [String: Bool]]
    
    private let constant = Constant()
    
    var body: some View {
        VStack {
            HStack {
                Text(constant.title)
                    .font(
                        .custom(constant.fonBold, size: constant.fontBoldSize)
                    )
                
                Spacer()
            }
            
            FiltersGrid(dict: $selectionDict, sections: $sections)
            
            VStack(alignment: .center) {
                FilterButton(mode: .apply) {
                    print("Apply")
                }
                
                FilterButton(mode: .reset) {
                    reset()
                }
                .padding(.top, constant.buttonPadding)
                
            }
            
            Divider()
                .foregroundColor(constant.gray)
                .padding(.top, constant.buttonPadding)
        }
    }
    
    private func bunding(for key: String) -> Binding<Bool> {
        return .init(
            get: { self.selectionDict[key, default: false] },
            set: { self.selectionDict[key] = $0 }
        )
    }
    
    private func reset() {
        selectionDict.removeAll()
        
        for section in sections {
            for (title, isSelected) in section.value {
                if isSelected {
                    sections[section.key]?[title] = false
                }
            }
        }
        
    }
    
}
