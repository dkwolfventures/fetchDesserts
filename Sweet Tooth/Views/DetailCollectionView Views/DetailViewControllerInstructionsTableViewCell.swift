//
//  DetailViewControllerInstructionsTableViewCell.swift
//  Sweet Tooth
//
//  Created by Coding on 4/11/22.
//

import UIKit

class DetailViewControllerInstructionsTableViewCell: UITableViewCell {
    
    //MARK: - properties
    
    //MARK: - lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    public func configure(with viewModel: DetailViewControllerInstructionsViewModel){
        self.contentConfiguration = viewModel.configuration
    }
}
