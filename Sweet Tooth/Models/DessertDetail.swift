//
//  DessertDetail.swift
//  Sweet Tooth
//
//  Created by Coding on 4/6/22.
//

import Foundation

struct DessertDetail: Codable {
    let meals: [[String: String?]]
    
    
}

extension DessertDetail {
    
    enum dictKeys: String, CaseIterable {
        case strIngredient
        case strMeasure
        case strInstructions
        case strMealThumb
    }
    
    func getMeasurements() -> [String] {return createArray(key: dictKeys.strMeasure.rawValue)}
    func getIngredients() -> [String] {return createArray(key: dictKeys.strIngredient.rawValue)}
    func getDescription() -> String {return getString(key: dictKeys.strInstructions.rawValue)}
    func getThumbnailUrlStr() -> String {return getString(key: dictKeys.strMealThumb.rawValue)}

}

private extension DessertDetail {
    
    func getString(key: String) -> String {
        guard let mealDict = meals[0].asDictionary(), let string = mealDict[key] as? String else {return ""}
        
        return string
    }
    
    func createArray(key: String) -> [String]{
        var intKey = 1
        guard let mealDict = meals[0].asDictionary() else {return [""]}
        var key = key
        var stringArr = [String]()
        
        while intKey < 21 {
            key = key + "\(intKey)"
            if let string = mealDict[key] as? String {
                stringArr.append(string)
                key.removeLast()
                intKey += 1
                continue
            } else {
                break
            }
        }
        
        stringArr = removeBlankSpotsInArrays(array: stringArr)
        return stringArr
    }
    
    func removeBlankSpotsInArrays(array: [String]) -> [String]{
        var arr = array
        
        while arr.last != nil && arr.last!.replacingOccurrences(of: " ", with: "").isEmpty {
            arr.removeLast()
        }
        
        return arr
    }
}
