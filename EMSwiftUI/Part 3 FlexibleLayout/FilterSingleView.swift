//
//  FilterSingleView.swift
//  EMSwiftUI
//
//  Created by macbook on 04.02.2024.
//

import SwiftUI

// MARK: - Constant

extension FilterSingleView {
    struct Constant {
        let radius: CGFloat = 8
        
        let plus = "+"
        
        let orange = Asset.Colors.orangeBase.swiftUIColor
        let white = Asset.Colors.whiteText.swiftUIColor
        let gray = Asset.Colors.whiteStar.swiftUIColor
        let black = Asset.Colors.blackBase.swiftUIColor
        
        let fontLight = FontFamily.SFProText.light
        let fontLightSize: CGFloat = 20
        
        let edgeInset = EdgeInsets(top: -8,
                                   leading: -8,
                                   bottom: -8,
                                   trailing: -8)
    }
}

struct FilterSingleView: View {
    // MARK: - Attributes
    
    @Binding var isSelected: Bool
    
    var title: String
    var action: () -> Void
    
    private let constant = Constant()
    
    var body: some View {
        Text(isSelected ? constant.plus + " " + title : title)
            .font(
                .custom(constant.fontLight, size: constant.fontLightSize)
            )
            .foregroundColor(isSelected ? constant.white : constant.black)
            .multilineTextAlignment(.center)
            .background(
                RoundedRectangle(cornerRadius: constant.radius)
                    .foregroundColor(isSelected ? constant.orange : constant.gray)
                    .padding(constant.edgeInset)
            )
            .onTapGesture {
                withAnimation {
                    self.isSelected.toggle()
                    action()
                }
            }
        
    }
}
