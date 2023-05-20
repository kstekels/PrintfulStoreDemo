//
//  Constants.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import Foundation


final class Constants {
    
    static let shared = Constants()
    
    // Paste Auth token here
    let authToken = "FA3dfYHVOHPTWb833EadtKrr6KsmIHIkNVo9LGAH"
    
    // Dimens
    let cornerRadius: CGFloat = 15
    let spacing: CGFloat = 6
    
    let itemImageWidth: CGFloat = 150
    let itemImageHeight: CGFloat = 150
    
    let verticalPadding: CGFloat = 6
    
    let progresViewScale: CGFloat = 1.5
    
    let loadingDelayTime: Double = 1.5
    
    let textLinLimitForTitle: Int = 2
    
    // Font Size
    let subtitleFontSize: CGFloat = 16
    let rowItemTitleFontSize: CGFloat = 18
    let detailsViewTitleSize: CGFloat = 26
    
    // Titles
    let categories = "Categories"
    let products = "Products"
    let favorites = "Favorites"
    let brand = "Brand"
    let model = "Model"
    let details = "Details"
    let delete = "Delete"
    let cancel = "Cancel"
    let close = "Close"
    
    
    //Text, messages
    let noProductsFound = "No products found"
    let noProductsSaved = "No products saved"
    let deleteItemMessage = "Do you want to remove this item from favorites?"
    let confirmationOfDeletion = "Confirmation of Deletion"
    let itemHasDeletedFromStorage = "Item has deleted from a storage!"
    
    private init() {}
}
