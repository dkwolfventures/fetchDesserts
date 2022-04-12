//
//  DetailViewControllerMeasurementsViewModel.swift
//  Sweet Tooth
//
//  Created by Coding on 4/11/22.
//

import Foundation
import UIKit

class DetailViewControllerMeasurementsViewModel {
    
    private let ingredient: String
    private let measurement: String
    private var config: UIListContentConfiguration
    
    init(ingredient: String, measurement: String, config: UIListContentConfiguration) {
        self.ingredient = ingredient
        self.measurement = measurement
        self.config = config
    }
    
    var rightSideStr: String {
        return measurement
    }
    
    var configuration: UIListContentConfiguration {
        config.text = ingredient
        config.textProperties.font = .systemFont(ofSize: 15)
        
        config.secondaryText = measurement
        config.secondaryTextProperties.font = .systemFont(ofSize: 15, weight: .heavy)
        return config
    }
    
}
