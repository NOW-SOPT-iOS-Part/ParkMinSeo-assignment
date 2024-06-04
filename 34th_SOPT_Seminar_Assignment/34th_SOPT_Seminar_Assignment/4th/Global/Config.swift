//
//  Config.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 5/10/24.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let APIKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist can not found")
        }
        return dict
    }()
}

extension Config {
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("baseURL is not in plist")
        }
        return key
    }()
    
    static let APIKey: String = {
        guard let key = Config.infoDictionary[Keys.Plist.APIKey] as? String else {
            fatalError("APIKey is not in plist")
        }
        return key
    }()
}
