//
//  JSONConverter.swift
//  httputils
//
//  Created by Suolapeikko on 27/03/2017.
//

import Foundation

struct JSONConverter {
    
    /// Make JSON conversion from Data (containing JSON) to Dictionary<String:Any>
    ///
    /// - parameters:
    ///   - Data: containing JSON
    /// - returns:
    ///   - Dictionary<String: Any>: JSON as Dictionary
    func convertJSONToDictionary(json: Data) -> [String:Any] {
        
        do {
            var values = try JSONSerialization.jsonObject(with: json, options: []) as? [String:Any]
            
            guard values != nil else {
                values = [:]
                return values!
            }
            return values!
        }
        catch {
            NSLog("convertJSONToDictionary: Unable to serialize JSON")
            return [:]
        }
    }
    
    /// Make JSON conversion from Data (containing JSON) to array of dictionaries [Dictionary<String:Any>]
    ///
    /// - parameters:
    ///   - Data: containing JSON
    /// - returns:
    ///   - [Dictionary<String: Any>]: JSON as array of dictionaries
    func convertJSONToDictionaryArray(json: Data) -> [[String:Any]] {
        
        do {
            var values = try JSONSerialization.jsonObject(with: json, options: []) as? [[String:Any]]
            guard values != nil else {
                values = [[:]]
                return values!
            }
            return values!
        }
        catch {
            NSLog("convertJSONToDictionaryArray: Unable to serialize JSON")
            return [[:]]
        }
    }
}
