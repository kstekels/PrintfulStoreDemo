//
//  ShakeEffect.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 25/05/2023.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    init(shouldShake: Bool) {
        animatableData = shouldShake ? 1 : 0
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotationAmount = CGFloat(sin(animatableData * .pi * CGFloat(shakesPerUnit)))
        return ProjectionTransform(CGAffineTransform(translationX: rotationAmount * amount, y: 0))
    }
}
