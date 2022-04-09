//
//  ViewController.swift
//  Sweet Tooth
//
//  Created by Coding on 4/6/22.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    private var desserts: Meals?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        fetchAllDesserts()
    }


}

private extension HomeTableViewController {
    
    func fetchAllDesserts(){
        APIManager.shared.fetchAllDesserts { [weak self] result in
            
            switch result {
            case .success(let desserts):
                self?.desserts = desserts
                self?.printDesserts(desserts: desserts)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func printDesserts(desserts: Meals){
        print(desserts)
    }
}
