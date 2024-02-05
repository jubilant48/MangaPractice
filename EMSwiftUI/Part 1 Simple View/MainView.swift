//
//  MainView.swift
//  EMSwiftUI
//
//  Created by Akbar Umetov on 17/12/23.
//

import SwiftUI

extension MainView {
    struct Constant {
        let white = Asset.Colors.whiteText.swiftUIColor
        
        let padding: CGFloat = 8
        let radius: CGFloat = 8
        
        let loadingTitle = "Loading"
    }
}

struct MainView: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: MangaListViewModel = MangaListViewModel()
    
    @State private var searchText: String = ""
    
    private let constant = Constant()
    
    var body: some View {
        NavigationView {
            NavigationStack {
                GeometryReader { geometry in
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        if let mangaList = viewModel.mangaList {
                            MangaSectionView(dataArray: mangaList.data)
                                .environmentObject(viewModel)
                        } else {
                            VStack {
                                ProgressView(constant.loadingTitle)
                                
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                        
                    } // - Scroll view
                    .searchable(text: $searchText,
                                placement: .navigationBarDrawer(displayMode: .always))
                }
            }
        } // - Navigation View 
        
    }
    
}

// MARK: - Preview 

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
