//
//  Model.swift
//  Practice-MVVM
//
//  Created by 김기현 on 2020/11/05.
//

import Foundation

struct Model {
    var itemIndex: String?
    var itemName: String?
    
    init(itemIndex: String, itemName: String) {
        self.itemIndex = itemIndex
        self.itemName = itemName
    }
    
    init(dictionary: NSDictionary) {
        self.itemIndex = dictionary["itemIndex"] as? String
        self.itemName = dictionary["itemName"] as? String
    }
    
    public static func modelFromDictionaryArray(array: NSArray) -> [Model] {
        var items: [Model] = []
        for data in array {
            guard let data = data as? NSDictionary else { break }
            items.append(Model(dictionary: data))
        }
        
        return items
    }
}
