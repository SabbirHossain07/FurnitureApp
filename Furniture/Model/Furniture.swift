//
//  Furniture.swift
//  Furniture
//
//  Created by Sopnil Sohan on 13/6/22.
//

import SwiftUI

struct Furniture: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var image: String
    var subTitle: String
    var price: String
}

var furnitures: [Furniture] = [
    Furniture(title: "Royle Palm Sofa", image: "chair 1", subTitle: "Ergonomical for humans body curve", price: "$299"),
    Furniture(title: "Leather Sofa", image: "chair 2", subTitle: "Extra comfy chair with a palm rest", price: "$499"),
    Furniture(title: "Modern Sofa", image: "chair 3", subTitle: "Ergonomical for humans body curve", price: "$199"),
    Furniture(title: "Luxary Sofa", image: "chair 6", subTitle: "Extra comfy chair with a palm rest", price: "$399"),
    Furniture(title: "Seto sofa", image: "chair 5", subTitle: "Ergonomical for humans body curve", price: "$599")
]

