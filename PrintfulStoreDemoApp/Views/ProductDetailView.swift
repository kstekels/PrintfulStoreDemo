//
//  ProductDetailView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 11/05/2023.
//

import SwiftUI
import UIKit

struct ProductDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest (sortDescriptors: []) var favoriteProducts: FetchedResults<Favorite>
    @State private var showAlert = false
    @State private var isShowingNotification = false
    @State private var isNotificationHidden = true
    @State private var descriptionTextHidden = true
    @State private var notification: Notification = .none
    
    let product: Product
    var onDismiss: () -> Void
    let isParentFavorites: Bool
    @State private var isZoomed: Bool = false
    
    @State private var isFavorit: Bool = false
    
    @State private var isShareSheetPresented = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: Constants.shared.spacing) {
                
                GradientBackground(content: {
                    Text(product.title.capitalized.splitString()?[0])
                        .font(.system(size: Constants.shared.detailsViewTitleSize))
                        .fontWeight(.bold)
                        .lineLimit(1)
                }, colors: [.white, .red], opacity: 0.5)
                
                AsyncImage(url: URL(string: product.image)) { image in
                    ZStack {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(Constants.shared.cornerRadius)
                    }
                } placeholder: {
                    Images.photo
                }
                .overlay(
                    Group {
                        if isShowingNotification {
                            NotificationView(message: notificationMessage, notification: $notification)
                                .transition(.opacity)
                                .opacity(!isNotificationHidden ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isNotificationHidden = false
                                        delayExecution {
                                            hideNotification()
                                            isNotificationHidden = true
                                        }
                                    }
                                }
                        }
                    }
                )
                .scaleEffect(isZoomed ? 1 : 0.8)
                Group {
                    HStack {
                        VStack(alignment: .leading, spacing: Constants.shared.spacing) {
                            if let brand = product.brand {
                                SubdetailsTextView(subdetails: Constants.shared.brand, text: brand, opacity: 0.8, color: .gray)
                            }
                            SubdetailsTextView(subdetails: Constants.shared.model, text: product.model, opacity: 0.4, color: .gray)
                        }
                    }
                    .padding(.vertical, Constants.shared.verticalPadding)
                    
                    TextBackgroundView(content: {
                        Text("\(product.description)")
                            .multilineTextAlignment(.leading)
                            .padding(4)
                    }, color: .gray, opacity: 0.1)
                }
                .opacity(!descriptionTextHidden ? 1 : 0)
            }
            .onAppear{
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                    isZoomed = true
                }
                delayExecution(with: 0.2) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        descriptionTextHidden = false
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle(Constants.shared.details)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 6) {
                        Button {
                            isShareSheetPresented.toggle()
                        } label: {
                            TabBarIcons.share
                        }
                        
                        Button {
                            //MARK: - Implemet to save
                            isFavorit.toggle()
                            if isFavorit {
                                let favorite = Favorite(context: managedObjectContext)
                                favorite.id = UUID()
                                favorite.productId = Int16(product.id)
                                favorite.categoryId = Int16(product.mainCategoryID)
                                do {
                                    try managedObjectContext.save()
                                    notification = .save
                                    showNotification()
                                } catch {
                                    debugPrint(error.localizedDescription)
                                }
                            } else {
                                showAlert = true
                            }
                        } label: {
                            (isFavorit ? TabBarIcons.hearFill : TabBarIcons.heart).foregroundColor(.red)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text(Constants.shared.delete),
                                message: Text(Constants.shared.deleteItemMessage),
                                primaryButton: .destructive(Text(Constants.shared.delete), action: {
                                    _ = favoriteProducts.map { product in
                                        if product.productId == self.product.id {
                                            managedObjectContext.delete(product)
                                            try? managedObjectContext.save()
                                            notification = .remove
                                            showNotification()
                                            isFavorit = false
                                        }
                                        return product
                                    }
                                    if isParentFavorites {
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }),
                                secondaryButton: .cancel(Text(Constants.shared.cancel), action: {
                                    isFavorit.toggle()
                                })
                            )
                        }
                    }
                    
                }
                
            }
            .onAppear {
                fetchDetails()
            }
            .onDisappear{
                onDismiss()
            }
            .sheet(isPresented: $isShareSheetPresented) {
                ActivityView(activityItems: [product.productDescriptionForSharing])
            }
        }
    }
    
    private func fetchDetails() {
        isFavorit = favoriteProducts.contains { favorite in
            favorite.productId == self.product.id
        }
    }
    
    private var notificationMessage: String {
        var msg: String = ""
        switch notification {
        case .save:
            msg = Constants.shared.saved
        case .remove:
            msg = Constants.shared.removed
        case .none:
            msg = ""
        }
        return msg
        
    }
    
    private func showNotification() {
        isShowingNotification = true
    }
    
    private func hideNotification() {
        isShowingNotification = false
    }
    
    
}

struct ProductDetailView_Previews: PreviewProvider {
    
    static let product = PreviewData.shared.products[0]
    
    static var previews: some View {
        NavigationStack {
            ProductDetailView(product: product, onDismiss: {}, isParentFavorites: false)
        }
    }
}



struct ActivityView: UIViewControllerRepresentable {
    let activityItems: [String]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        controller.excludedActivityTypes = [
            .print,
        ]
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
