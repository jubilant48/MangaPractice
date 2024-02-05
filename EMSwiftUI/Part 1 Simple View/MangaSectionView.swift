//
//  MangaSectionView.swift
//  EMSwiftUI
//
//  Created by Akbar Umetov on 18/12/23.
//

import SwiftUI

// MARK: - Constant

extension MangaSectionView {
    struct Constant {
        let columns: [GridItem] = [
            GridItem(.adaptive(minimum: 100), spacing: 25),
            GridItem(.adaptive(minimum: 100), spacing: 25),
            GridItem(.adaptive(minimum: 100), spacing: 25)
        ]
        
        let gridSpacing: CGFloat = 4
        
        let noTitle = "No eng title"
    }
}

struct MangaSectionView: View {
    // MARK: - Attributes
    
    @EnvironmentObject var viewModel: MangaListViewModel
    
    var dataArray: [MangaData]
    
    private let constant = Constant()
    
    var body: some View {
        VStack {
            
            
            ForEach(0..<6) { _ in
                MangaSectionTitleView()
                
                LazyVGrid(columns: constant.columns, spacing: constant.gridSpacing) {
                    ForEach(dataArray, id: \.id) { data in
                        if let imageUrl = viewModel.getCoverURL(manga: data, sizeFormat: .size512),
                           let mangaTitle = data.attributes.title.en {
                            
                            MangaSingleGridView(title: mangaTitle,
                                                url: imageUrl,
                                                tags: data.attributes.tags)
                        } else if let imageUrl = viewModel.getCoverURL(manga: data, sizeFormat: .size512) {
                            MangaSingleGridView(title: constant.noTitle, url: imageUrl, tags: data.attributes.tags)
                        }
                        
                    }
                }
                
            }
            
            
        }
    }
}
