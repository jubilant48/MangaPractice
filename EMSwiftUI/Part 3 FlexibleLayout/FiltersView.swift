//
//  FiltersView.swift
//  EMSwiftUI
//
//  Created by macbook on 04.02.2024.
//

import SwiftUI

extension FiltersView {
    struct Constant {
        let padding: CGFloat = 24
    }
}

struct FiltersView: View {
    // MARK: - Attributes
    
    @Binding var selectedDict: [String: Bool]
    @Binding var sections: [FilterSectionModel: [String: Bool]]
    
    private let constant = Constant()
    
    private let sectionsArray: [FilterSectionModel] = [
        .contantRaiting,
        .publicationStatus,
        .magazineDemographic,
        .format,
        .genre,
        .theme
    ]
    
    var body: some View {
        VStack {
            ForEach(sectionsArray, id: \.hashValue) { section in
                FilterCollapsibleView(selectedDict: $selectedDict,
                                      section: section,
                                      sections: $sections)
            }
        }
    }
}


