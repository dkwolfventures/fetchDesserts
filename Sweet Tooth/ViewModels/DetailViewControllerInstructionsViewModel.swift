//
//  DetailViewControllerInstructionsViewModel.swift
//  Sweet Tooth
//
//  Created by Coding on 4/11/22.
//

import Foundation
import UIKit

class DetailViewControllerInstructionsViewModel {
    
    private let instructions: String
    private var config: UIListContentConfiguration
    
    init(instructions: String, config: UIListContentConfiguration) {
        self.instructions = instructions
        self.config = config
    }
    
    var configuration: UIListContentConfiguration {
        config.text = instructions
        config.textProperties.font = .systemFont(ofSize: 18)
        return config
    }
    
}
