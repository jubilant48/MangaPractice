//
//  MangaSectionTitleView.swift
//  EMSwiftUI
//
//  Created by Akbar Umetov on 18/12/23.
//

import SwiftUI

// MARK: - Constant

extension MangaSectionTitleView {
    struct Constant {
        let sectionTitle: String = "Popular"
        let moreTitle: String = "more"
        
        let icons = Asset.Icons.moreIcon.swiftUIImage
        
        let fontBold = FontFamily.SFProText.bold
        let fintBoldSize: CGFloat = 20
        
        let fontLight = FontFamily.SFProText.light
        let fontLightSize: CGFloat = 16
        
        let blackColor = Asset.Colors.blackBase.swiftUIColor
        
        let padding: CGFloat = 16
    }
}

struct MangaSectionTitleView: View {
    // MARK: - Attributes
    
    private var constant: Constant = Constant()
    
    var body: some View {
        HStack {
            Text(constant.sectionTitle)
                .font(
                    .custom(constant.fontBold,
                            size: constant.fintBoldSize)
                )
            
            Spacer()
            
            Button {
                print("Opening more...")
            } label: {
                Text(constant.moreTitle)
                    .font(
                        .custom(constant.fontLight,
                                size: constant.fontLightSize)
                    )
                
                constant.icons
            }
            .foregroundColor(constant.blackColor)
        }
        .padding([.trailing, .leading], constant.padding)
        .padding(.bottom, constant.padding)
    }
}
