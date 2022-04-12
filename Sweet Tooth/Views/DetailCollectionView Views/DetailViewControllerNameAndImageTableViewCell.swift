//
//  DetailViewControllerNameAndImageTableViewCell.swift
//  Sweet Tooth
//
//  Created by Coding on 4/11/22.
//

import UIKit
import Kingfisher

class DetailViewControllerNameAndImageTableViewCell: UITableViewCell {
    
    //MARK: - lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    public func configure(with viewModel: DetailViewControllerNameAndImageViewModel){
        var config = viewModel.configuration
        
        guard let url = viewModel.imageURL else {return}
    
        KingfisherManager.shared.retrieveImage(with: url) { result in
            
            switch result {
            case .success(let image):
                config.image = image.image
                self.contentConfiguration = config
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
