//
//  ProductDetailView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 11/05/2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest (sortDescriptors: []) var favoriteProducts: FetchedResults<Favorite>
    @State private var showAlert = false
    
    let product: Product
    var onDismiss: () -> Void
    let isParentFavorites: Bool
    @State private var isZoomed: Bool = false
    
    @State private var isFavorit: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: Constants.shared.spacing) {
                Text(product.title.capitalized)
                    .font(.system(size: Constants.shared.detailsViewTitleSize))
                    .fontWeight(.bold)
                
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
                .scaleEffect(isZoomed ? 1 : 0.8)
                .onAppear{
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                        isZoomed = true
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: Constants.shared.spacing) {
                        if let brand = product.brand {
                            SubdetailsTextView(subdetails: Constants.shared.brand, text: brand)
                        }
                        SubdetailsTextView(subdetails: Constants.shared.model, text: product.model)
                    }
                    Spacer()
                }
                .padding(.vertical, Constants.shared.verticalPadding)
                
                Text("\(product.description)")
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle(Constants.shared.details)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
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
                            } catch {
                                debugPrint(error.localizedDescription)
                            }
                        } else {
                            showAlert = true
                        }
                    } label: {
                        isFavorit ? TabBarIcons.hearFill : TabBarIcons.heart
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
            .onAppear {
                isFavorit = favoriteProducts.contains { favorite in
                    favorite.productId == self.product.id
                }
            }
            .onDisappear{
                onDismiss()
            }
        }
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
