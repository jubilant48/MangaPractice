//
//  RatingView.swift
//  EMSwiftUI
//
//  Created by Akbar Umetov on 18/12/23.
//

import SwiftUI

extension RatingView {
    struct Constant {
        let size: CGSize = CGSize(width: 20, height: 20)
        
        let starImage = Asset.Icons.starIcon.swiftUIImage
    }
}

struct RatingView: View {
    // MARK: - Attributes
    
    private let constant = Constant()
    
    @ObservedObject var calculation: RatingViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            
            ForEach(0..<calculation.maxRating) { index in
                constant.starImage
                    .resizable()
                    .foregroundStyle(
                        .linearGradient(
                            stops: self.calculation.gradients[index],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: constant.size.width,
                           height: constant.size.height)
                    .onTapGesture {
                        self.calculation.rating = CGFloat(index) + 1
                        self.calculation.calculation()
                    }
            }
            
            
        }
    }
    
}
