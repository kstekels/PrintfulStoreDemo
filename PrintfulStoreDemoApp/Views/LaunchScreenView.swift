//
//  LaunchScreenView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 20/05/2023.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isShowingMainContent = false
    @State private var isAnimated = false
    
    var body: some View {
        VStack {
            Spacer()
            AssetImage.launchScreenLogo
                .scaleEffect(isAnimated ? 1 : 0)
            Spacer()
            
            HStack {
                Spacer()
                Text(Constants.shared.createdBy)
                    .createdByTextStyle(isAnimated: $isAnimated)
                
                ZStack(alignment: .center) {
                    LinearGradient(
                        colors: [.red, .blue, .green, .yellow],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 150, height: 50)
                    .mask {
                        Text(Constants.shared.developer)
                            .developerTextStyle(isAnimated: $isAnimated)
                    }
                }
                Spacer()
            }
            
        }
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.6)) {
                isAnimated = true
            }
            delayExecution {
                withAnimation {
                    isShowingMainContent = true
                }
            }
        }
        .fullScreenCover(isPresented: $isShowingMainContent, content: {
            HomeView()
        })
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
