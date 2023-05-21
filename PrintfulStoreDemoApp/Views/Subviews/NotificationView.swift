//
//  NotificationView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 21/05/2023.
//

import SwiftUI

enum Notification {
    case save,remove,none
}

struct NotificationView: View {
    var message: String
    @Binding var notification: Notification
    
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.white)
                .font(.largeTitle)
            
            Text(message)
                .padding(.horizontal)
                .foregroundColor(.white)
                .font(.headline)
            
        }
        .padding()
        .background(notification == .save ? .green : .red)
        .opacity(0.8)
        .cornerRadius(15)
        .frame(width: 200, height: 200)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(message: "Saved", notification: .constant(.remove))
    }
}
