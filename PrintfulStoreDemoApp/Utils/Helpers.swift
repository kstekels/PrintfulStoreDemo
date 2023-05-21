//
//  Helpers.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import Foundation

/// Delay for 2s
func delayExecution(with delayTime: Double = Constants.shared.loadingDelayTime, compeltion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
        compeltion()
    }
}
