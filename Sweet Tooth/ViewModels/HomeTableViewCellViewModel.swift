//
//  HomeTableViewCellViewModel.swift
//  Sweet Tooth
//
//  Created by Coding on 4/7/22.
//

import Foundation
import UIKit

class HomeTableViewCellViewModel {
    
    private let dessert: Meal?
    private var config: UIListContentConfiguration
    
    init(dessert: Meal?, config: UIListContentConfiguration) {
        self.dessert = dessert
        self.config = config
    }
    
    var configuration: UIListContentConfiguration {
        config.text = dessertTitle
        config.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        config.imageProperties.cornerRadius = 8
        return config
    }
    
    var imageURL: URL? {
        return isDessertNil ? nil : URL(string: dessert!.strMealThumb)
    }
    
}

private extension HomeTableViewCellViewModel {
    
    var isDessertNil: Bool {
        return dessert == nil
    }
    
    var dessertTitle: String {
        return isDessertNil ? "No desserts to present." : dessert!.strMeal
    }
}
