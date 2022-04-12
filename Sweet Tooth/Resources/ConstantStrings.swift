//
//  ConstantStrings.swift
//  Sweet Tooth
//
//  Created by Coding on 4/7/22.
//

import Foundation

public enum ConstantsStrs {
    case appTitle
    
    var string: String {
        switch self {
        case .appTitle:
            return "Fetch Desserts"
        }
    }
}
