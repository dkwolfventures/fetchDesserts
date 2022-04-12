//
//  DetailViewControllerMeasurementTableViewCell.swift
//  Sweet Tooth
//
//  Created by Coding on 4/11/22.
//

import UIKit

class DetailViewControllerMeasurementTableViewCell: UITableViewCell {
    
    //MARK: - properties
    private let rightSideLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    //MARK: - lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(rightSideLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rightSideLabel.anchor(top: topAnchor, right: rightAnchor, paddingRight: contentView.width/20)
        rightSideLabel.centerY(inView: contentView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rightSideLabel.text = nil
    }
    
    //MARK: - helpers
    public func configure(with viewModel: DetailViewControllerMeasurementsViewModel){
//        rightSideLabel.text = viewModel.rightSideStr
        self.contentConfiguration = viewModel.configuration
    }
}
