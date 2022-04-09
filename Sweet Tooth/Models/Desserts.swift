//
//  Dessert.swift
//  Sweet Tooth
//
//  Created by Coding on 4/6/22.
//

import Foundation

// MARK: - Desserts
struct Desserts: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
