//
//  APIManager.swift
//  Sweet Tooth
//
//  Created by Coding on 4/6/22.
//

import Foundation

final class APIManager {
    static let shared = APIManager()
    
    private init(){}
    
    //MARK: - public helpers
    public func fetchAllDesserts(completion: @escaping(Result<Meals, Error>) -> Void){
        
        let url = URL(string: Constants.allDessertsURL)
        self.request(url: url, expecting: Meals.self, completion: completion)
    }
    
    public func fetchDessertDetails(dessertId: String, completion: @escaping(Result<DessertDetail, Error>) -> Void){
        
        let url = URL(string: Constants.dessertDetailURL + dessertId)
        self.request(url: url, expecting: DessertDetail.self, completion: completion)
    }
    
}

private extension APIManager {
    
    struct Constants {
        static let allDessertsURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        static let dessertDetailURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    }
    
    enum APIError: Error {
        case noDataReturned
        case invalidURL
    }
    
    func request<T: Codable>(url: URL?,
                             expecting: T.Type,
                             completion: @escaping(Result<T, Error>) -> Void){
        guard let url = url else {
            //invalid url
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            
            guard let data = data, error == nil else  {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
