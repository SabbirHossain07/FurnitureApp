//
//  AppViewModel.swift
//  Furniture
//
//  Created by Sopnil Sohan on 13/6/22.
//

import SwiftUI

class AppViewModel: ObservableObject {
    //MARK: Properties
    @Published var currentTab: Tab = .home
    //MARK: Home Properties
    @Published var currentMenu: String = "All"
    
    //MARK: Detail View Properties
    @Published var showDetailView: Bool = false
    @Published var currentActiveItem: Furniture?
}

