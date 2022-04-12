//
//  ViewController.swift
//  Sweet Tooth
//
//  Created by Coding on 4/6/22.
//

import UIKit
import SwiftUI

class HomeTableViewController: UITableViewController {
    
    private var desserts: Meals?
    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .label
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIndicator()
        title = ConstantsStrs.appTitle.string
        
        fetchAllDesserts()
        configureCells()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        indicator.center(inView: view)
    }
    
}

//MARK: - Table View Delegate
extension HomeTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let desserts = desserts {
            return desserts.meals.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let chosenDessert = desserts?.meals[indexPath.row] else {return}
        APIManager.shared.fetchDessertDetails(dessertId: chosenDessert.idMeal) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let dessert):
                    self?.show(DetailViewController(dessert: dessert, name: chosenDessert.strMeal), sender: self)
                case .failure(_):
                    self?.showAlert()
                }
            }
        }
    }
}

//MARK: - TableView Data Source
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell.dequeueReusableCell(forTableView: tableView, forIndexPath: indexPath)
        let config = cell.defaultContentConfiguration()
        let model = HomeTableViewCellViewModel(dessert: desserts?.meals[indexPath.row], config: config)
        cell.configure(with: model)
        return cell
    }
}

private extension HomeTableViewController {
    
    func configureCells(){
        HomeTableViewCell.register(forTableView: tableView)
    }
    
    func fetchAllDesserts(){
        APIManager.shared.fetchAllDesserts { [weak self] result in
            
            switch result {
            case .success(let desserts):
                self?.desserts = desserts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.indicator.stopAnimating()
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }
    
    func printDesserts(desserts: Meals){
        print(desserts)
    }
    
    func showAlert(){
        indicator.stopAnimating()
        let alert = UIAlertController(title: "Hey there!", message: "Seems like you're having an issue with the internet, would you like to try again?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in
            self?.indicator.startAnimating()
            self?.fetchAllDesserts()
        }))
        
        present(alert, animated: true)
    }
    
    func setIndicator(){
        view.addSubview(indicator)
        indicator.startAnimating()
    }
    
}
