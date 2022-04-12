//
//  DetailViewControllerNameAndImageViewModel.swift
//  Sweet Tooth
//
//  Created by Coding on 4/11/22.
//

import Foundation
import UIKit

class DetailViewControllerNameAndImageViewModel {
    
    private let name: String
    private let thumbnailUrlStr: String
    private var config: UIListContentConfiguration
    
    init(name: String, thumbnailUrlStr: String, config: UIListContentConfiguration) {
        self.name = name
        self.thumbnailUrlStr = thumbnailUrlStr
        self.config = config
    }
    
    var configuration: UIListContentConfiguration {
        config.text = name
        config.textProperties.font = .systemFont(ofSize: 30, weight: .heavy)
        config.imageProperties.maximumSize = CGSize(width: 75, height: 75)
        config.imageProperties.cornerRadius = 8
        return config
    }
    
    var imageURL: URL? {
        return URL(string: thumbnailUrlStr)
    }
    
}
