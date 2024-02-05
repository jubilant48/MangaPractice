//
//  MangaSingleGridView.swift
//  EMSwiftUI
//
//  Created by Akbar Umetov on 18/12/23.
//

import SwiftUI

extension MangaSingleGridView {
    struct Constant {
        let width: CGFloat = 100
        let height: CGFloat = 208
        
        let imageHeight: CGFloat = 144
        let imageRaduis: CGFloat = 4
        
        let lineLimit = 1
        
        let fontBold = FontFamily.SFProText.bold
        let fontBoldSize: CGFloat = 16
        
        let fontLight = FontFamily.SFProText.light
        let fontLightSize: CGFloat = 14
        
        let imageBottomPadding: CGFloat = 4
        
        let maxRating = 5
        
        let black = Asset.Colors.blackBase.swiftUIColor
        let gray = Asset.Colors.grayBase.swiftUIColor
        
        let padding: CGFloat = 16
        let paddingBottom: CGFloat = 24
        
        let spacingSection: CGFloat = 4
        let spacingBottomArea: CGFloat = 0
        
        var ratings: [CGFloat] = [
            4.2, 2.3, 4.9, 3.0, 1.8, 3.4, 3.2
        ]
    }
}

struct MangaSingleGridView: View {
    // MARK: - Attributes
    
    var title: String
    var url: URL
    var tags: [Tag]

    
    private let constant = Constant()
    
    var body: some View {
        VStack(spacing: constant.spacingSection) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .cornerRadius(constant.imageRaduis)
                    .frame(width: constant.width, height: constant.imageHeight)
                    .padding(.bottom, constant.imageBottomPadding)
            } placeholder: {
                ZStack {
                    Color.white
                        .cornerRadius(constant.imageRaduis)
                    
                    ProgressView("Loading")
                }
            }
            
            VStack(spacing: constant.spacingBottomArea) {
                Text(title)
                    .font(
                        .custom(constant.fontBold, size: constant.fontBoldSize)
                    )
                    .foregroundColor(constant.black)
                    .lineLimit(constant.lineLimit)
                
                RatingView(calculation: RatingViewModel(rating: constant.ratings.randomElement() ?? 0.0))

                Text(getGenre())
                    .font(
                        .custom(constant.fontLight, size: constant.fontLightSize)
                    )
                    .foregroundColor(constant.gray)
                
            }
            .frame(width: constant.width)
            
        }
        .frame(width: constant.width,
               height: constant.height)
        .padding(.bottom, constant.paddingBottom)
        .padding([.leading, .trailing], constant.padding)
    }
    
    // MARK: - Methods
    
    func getGenre() -> String {
        var genreArray: [String] = []
        
        for tag in tags {
            if let newGenre = tag.attributes.name.en {
                genreArray.append(newGenre)
            }
        }
        
        genreArray.sort(by: <)
        
        return genreArray.reduce("") { partialResult, genre in
            var result = partialResult
            
            if genreArray.first == genre {
                result += genre + ","
            } else if genreArray.last == genre {
                result += genre
            } else {
                result += genre + ","
            }
            
            return result
        }
    }
    
    
}
