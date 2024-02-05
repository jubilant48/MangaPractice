//
//  FilterButton.swift
//  EMSwiftUI
//
//  Created by macbook on 05.02.2024.
//

import SwiftUI

// MARK: - Constant

extension FilterButton {
    struct Constant {
        let orange = Asset.Colors.orangeBase.swiftUIColor
        let clear = Color.clear
        let white = Asset.Colors.whiteText.swiftUIColor
        let black = Asset.Colors.blackBase.swiftUIColor
        
        let fontLight = FontFamily.SFProText.medium
        let fontLightSize: CGFloat = 16
        
        let radius: CGFloat = 8
        let padding: CGFloat = 12
    }
}

// MARK: - Mode

extension FilterButton {
    enum Mode: String {
        case apply = "Apply"
        case reset = "Reset"
    }
}

struct FilterButton: View {
    // MARK: - Attributes
    
    private let constant = Constant()
    
    private var title: String
    private var action: () -> Void
    private let mode: FilterButton.Mode
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: action) {
                Text(title)
                    .font(
                        .custom(constant.fontLight, size: constant.fontLightSize)
                    )
                    .foregroundColor(mode == .apply ? constant.white : constant.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding([.top, .bottom], constant.padding)
            }
            .background(
                RoundedRectangle(cornerRadius: constant.radius)
                    .foregroundColor(mode == .apply ? constant.orange : constant.clear)
            )

        }
    }
    
    // MARK: - Init
    
    init(mode: FilterButton.Mode, action: @escaping () -> Void) {
        self.title = mode.rawValue
        self.action = action
        self.mode = mode
    }
}
