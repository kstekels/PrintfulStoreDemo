//
//  LaunchScreenView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 20/05/2023.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isShowingMainContent = false
    
    var body: some View {
        VStack {
            Spacer()
            AssetImage.launchScreenLogo
            Spacer()
            HStack {
                Text(Constants.shared.createdBy)
                    .font(.callout)
                    .foregroundColor(.accentColor)
                
                Text(Constants.shared.developer)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
        }
        .onAppear {
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
