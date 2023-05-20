//
//  PreviewData.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 19/05/2023.
//

import Foundation
//
//enum dataForPreview: String {
//    case categories
//    case products
//    case productDetails
//
//    var value: String {
//        self.rawValue
//    }
//}

final class PreviewData {
    
    static let shared = PreviewData()
    
    let categories: [Category] = [
        Category(
            id: 1,
            parentId: 0,
            imageURL: "https://files.cdn.printful.com/o/upload/catalog_category/fb/fbf0cf796a5603666e85713ece1708a1_t?v=1680080851",
            catalogPosition: 1,
            size: .small,
            title: "Men's clothing"
        ),
        Category(
            id: 24,
            parentId: 6,
            imageURL: "https://files.cdn.printful.com/o/upload/catalog_category/b1/b1513c82696405fcc316fc611c57f132_t?v=1680080851",
            catalogPosition: 5,
            size: .small,
            title: "T-shirts"
        )
    ]
    let products: [Product] = [
        Product(
            id: 362,
            mainCategoryID: 24,
            type: "T-SHIRT",
            typeName: "T-Shirt",
            title: "Unisex Organic T-Shirt | Econscious EC1000",
            brand: "Econscious",
            model: "Unisex Organic T-Shirt",
            image: "https://files.cdn.printful.com/o/upload/product-catalog-img/36/368b1e295bf87a5a9f656ef9e113b8b3_l",
            variantCount: 10,
            currency: "USD",
            isDiscontinued: false,
            avgFulfillmentTime: nil,
            description: "Go natural—order this t-shirt and enjoy the comfort of a truly all-natural organic cotton that is grown and harvested without any fertilizers and pesticides. The high-quality ringspun cotton yarns make sure that the fabric is extra soft and durable. If you’re looking to invest in ethical clothing that is sure to last and has a low environmental impact, look no further than this organic t-shirt!\r\n\r\n• 100% certified organic ring-spun cotton\r\n• Fabric weight: 5.5 oz/yd² (186.5 g/m²)\r\n• Regular fit\r\n• Side-seamed construction\r\n• 1×1 rib neck\r\n• Shoulder seam finished with a self-fabric tape\r\n• Double-needle coverstitched seams\r\n• Low environmental impact\r\n• Blank product sourced from Mexico",
            originCountry: "Mexico"
        ),
        Product(
            id: 370,
            mainCategoryID: 105,
            type: "T-SHIRT",
            typeName: "Hoodie",
            title: "Kids Hoodie | AWDis JHY001",
            brand: "AWDis",
            model: "Kids Hoodie",
            image: "https://files.cdn.printful.com/o/upload/product-catalog-img/b8/b8d9d8ccec0eebea80203a7bf7c1c09b_l",
            variantCount: 20,
            currency: "USD",
            isDiscontinued: false,
            avgFulfillmentTime: nil,
            description: "Everyone wants to be cozy and warm and still look stylish—kids are no exception. Prepare the little one for any chilly evening by ordering this kids’ hoodie. It has a front kangaroo pouch pocket, which has a small hidden opening for an earphone cord and double fabric hood for extra warmth. What’s more, to ensure the kids' safety, the hoodie comes with no drawcords.\r\n\r\n• 80% ring-spun cotton, 20% polyester\r\n• Fabric weight: 8.3 oz/yd² (280 g/m²)\r\n• Double-layered hood\r\n• No drawcords\r\n• Kangaroo pouch pocket with a hidden opening for earphone cord\r\n• Ribbed cuffs and hem\r\n• Twin needle stitching detailing\r\n• Blank product sourced from Pakistan",
            originCountry: nil
        )
    ]
    let productDetail: Product = Product(
        id: 362,
        mainCategoryID: 24,
        type: "T-SHIRT",
        typeName: "T-Shirt",
        title: "Unisex Organic T-Shirt | Econscious EC1000",
        brand: "Econscious",
        model: "Unisex Organic T-Shirt",
        image: "https://files.cdn.printful.com/o/upload/product-catalog-img/36/368b1e295bf87a5a9f656ef9e113b8b3_l",
        variantCount: 10,
        currency: "USD",
        isDiscontinued: false,
        avgFulfillmentTime: nil,
        description: "Go natural—order this t-shirt and enjoy the comfort of a truly all-natural organic cotton that is grown and harvested without any fertilizers and pesticides. The high-quality ringspun cotton yarns make sure that the fabric is extra soft and durable. If you’re looking to invest in ethical clothing that is sure to last and has a low environmental impact, look no further than this organic t-shirt!\r\n\r\n• 100% certified organic ring-spun cotton\r\n• Fabric weight: 5.5 oz/yd² (186.5 g/m²)\r\n• Regular fit\r\n• Side-seamed construction\r\n• 1×1 rib neck\r\n• Shoulder seam finished with a self-fabric tape\r\n• Double-needle coverstitched seams\r\n• Low environmental impact\r\n• Blank product sourced from Mexico",
        originCountry: "Mexico"
    )
    
    private init() {}
}
