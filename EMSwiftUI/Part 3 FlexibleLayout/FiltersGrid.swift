//
//  FiltersGrid.swift
//  EMSwiftUI
//
//  Created by macbook on 04.02.2024.
//

import SwiftUI

// MARK: - Constant

extension FiltersGrid {
    struct Constant {
        let padding: CGFloat = 16
        let gridSpacing: CGFloat = 24
    }
}

struct FiltersGrid: View {
    // MARK: - Attributes
    
    @Binding var dict: [String: Bool]
    @Binding var sections: [FilterSectionModel: [String: Bool]]
    
    private let constant = Constant()
    
    var body: some View {
        FlowLayout(mode: .scrollable, items: dict.keys.sorted()) { title in
            FilterSingleView(isSelected: self.bunding(for: title),
                             title: title) {
                unselectedTag(for: title)
                
                withAnimation(.linear(duration: 0.01)) {
                    self.dict[title] = nil
                }
            }
            .padding([.trailing, .bottom], constant.padding)
            
        }
    }
    
    private func bunding(for key: String) -> Binding<Bool> {
        return .init(
            get: { self.dict[key, default: false] },
            set: { self.dict[key] = $0 }
        )
    }
    
    private func unselectedTag(for tag: String) {
        for section in sections {
            for (title, _) in section.value {
                if title == tag {
                    self.sections[section.key]?[title] = false
                }
            }
        }
    }
}

