//
//  DetailViewController.swift
//  Sweet Tooth
//
//  Created by Coding on 4/10/22.
//

import Foundation
import UIKit

class DetailViewController: UITableViewController {
    
    //MARK: - properties
    private var dessert: DessertDetail
    private let dessertName: String
    private let descriptionStr: String
    private let thumbnailUrlStr: String
    private let ingredients: [String]
    private let measurements: [String]

    //MARK: - lifecycle
    init(dessert: DessertDetail, name: String){
        self.dessert = dessert
        self.descriptionStr = dessert.getDescription()
        self.ingredients = dessert.getIngredients()
        self.measurements = dessert.getMeasurements()
        self.thumbnailUrlStr = dessert.getThumbnailUrlStr()
        self.dessertName = name
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = dessertName
        configureTableView()
    }
    
    
    //MARK: - actions
    
    //MARK: - helpers
}

//MARK: - Table View Delegate
extension DetailViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 1:
            return ingredients.count
        default:
            return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = indexPath.section
        
        let nameHeight = dessertName.height(withConstrainedWidth: view.width - 115, font: .systemFont(ofSize: 30, weight: .heavy)) + 30
        
        switch section {
        case 0:
            return nameHeight > 95 ? nameHeight : 95
        case 1:
            return 60
        case 2:
            return descriptionStr.height(withConstrainedWidth: view.width - 65, font: .systemFont(ofSize: 18)) + 30
            
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
        
    }
}

//MARK: - TableView Data Source
extension DetailViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        switch section {
        case 0:
            let cell = DetailViewControllerNameAndImageTableViewCell.dequeueReusableCell(forTableView: tableView, forIndexPath: indexPath)
            let config = cell.defaultContentConfiguration()
            let model = DetailViewControllerNameAndImageViewModel(name: dessertName, thumbnailUrlStr: thumbnailUrlStr, config: config)
            cell.configure(with: model)
            return cell
        case 1:
            let cell = DetailViewControllerMeasurementTableViewCell.dequeueReusableCell(forTableView: tableView, forIndexPath: indexPath)
            let config = cell.defaultContentConfiguration()
            let model = DetailViewControllerMeasurementsViewModel(ingredient: ingredients[indexPath.row], measurement: measurements[indexPath.row], config: config)
            cell.configure(with: model)
            return cell
        case 2:
            let cell = DetailViewControllerInstructionsTableViewCell.dequeueReusableCell(forTableView: tableView, forIndexPath: indexPath)
            let config = cell.defaultContentConfiguration()
            let model = DetailViewControllerInstructionsViewModel(instructions: descriptionStr, config: config)
            cell.configure(with: model)
            return cell
        default:
            fatalError()
        }
    }
}

//MARK: - private helpers
private extension DetailViewController {
    func configureTableView(){
        DetailViewControllerNameAndImageTableViewCell.register(forTableView: tableView)
        DetailViewControllerMeasurementTableViewCell.register(forTableView: tableView)
        DetailViewControllerInstructionsTableViewCell.register(forTableView: tableView)
    }
//    func configureCollectionView(){
//
//        let descriptionHeight = descriptionStr.height(withConstrainedWidth: view.width, font: .systemFont(ofSize: <#T##CGFloat#>))
//    }
//
}
