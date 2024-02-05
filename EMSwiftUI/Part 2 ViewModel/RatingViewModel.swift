//
//  RatingViewModel.swift
//  EMSwiftUI
//
//  Created by macbook on 04.02.2024.
//

import SwiftUI

@MainActor
final class RatingViewModel: ObservableObject {
    // MARK: - Attributes
    
    @Published var gradients: [[Gradient.Stop]] = []
    
    var rating: CGFloat = 0.0
    var maxRating: Int = 5
    
    private var lock = NSLock()
    private var call: Int = 0
    
    let fillColor = Asset.Colors.yellowBase.swiftUIColor
    let color = Asset.Colors.whiteStar.swiftUIColor
    
    // MARK: - Init
    
    init(rating: CGFloat) {
        self.rating = rating
        
        self.calculation()
    }
    
    // MARK: - Methods
    
    func calculation() {
        self.gradients.removeAll()
        
        for _ in 0..<self.maxRating {
            self.getGradientStop()
        }
        
    }
    
    private func getGradientStop() {
        call += 1
        
        if CGFloat(call) < rating {
            self.gradients.append([
                Gradient.Stop(color: fillColor, location: 1.0)
            ])
        } else if CGFloat(call) >= rating &&
                  CGFloat(call) - rating < 1.0 {
            let remain = CGFloat(call) - rating
            
            self.gradients.append([
                Gradient.Stop(color: fillColor, location: 1.0 - remain),
                Gradient.Stop(color: color, location: .ulpOfOne)
            ])
        } else {
            self.gradients.append([
                Gradient.Stop(color: color, location: 1.0)
            ])
        }
        
        if call == maxRating {
            call = 0
        }
    }

}
