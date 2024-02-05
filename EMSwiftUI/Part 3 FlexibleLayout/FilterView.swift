//
//  FilterView.swift
//  EMSwiftUI
//
//  Created by Akbar Umetov on 18/12/23.
//

import SwiftUI

// MARK: - Constant

extension FilterView {
    struct Constant {
        let padding: CGFloat = 16
        let topPadding: CGFloat = 32
        
        let title = "Filters"
        
        let font = FontFamily.SFProText.heavy
        let fontSize: CGFloat = 24
        
        let black = Asset.Colors.blackBase.swiftUIColor
    }
}

struct FilterView: View {
    // MARK: - Attributes
    
    @State private var selectedDict: [String: Bool] = [:]
    @State private var sections: [FilterSectionModel: [String: Bool]] = [
        .contantRaiting: FilterSectionModel.contantRaiting.tags,
        .publicationStatus: FilterSectionModel.publicationStatus.tags,
        .magazineDemographic: FilterSectionModel.magazineDemographic.tags,
        .format: FilterSectionModel.format.tags,
        .genre: FilterSectionModel.genre.tags,
        .theme: FilterSectionModel.theme.tags
    ]
    
    private let constant = Constant()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                FilterSelectionView(selectionDict: $selectedDict, sections: $sections)
                    .padding([.leading, .trailing], constant.padding)
                    .padding(.bottom, constant.padding)
                    .padding(.top, constant.topPadding)
                
                FiltersView(selectedDict: $selectedDict, sections: $sections)
                    .padding([.leading, .trailing], constant.padding)
                    .padding(.top, constant.padding)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(constant.title)
                        .font(
                            .custom(constant.font, size: constant.fontSize)
                        )
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "multiply")
                        .foregroundColor(constant.black)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

// MARK: - Preview

struct FilterView_Preview: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
