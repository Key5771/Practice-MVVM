//
//  ViewModel.swift
//  Practice-MVVM
//
//  Created by 김기현 on 2020/11/05.
//

import Foundation

class ViewModel {
    
    var items: [Model] = []
    var itemJSON = [["itemIndex" : "1", "itemName" : "Washing Car"],
                    ["itemIndex" : "2", "itemName" : "Book Movie Ticket"],
                    ["itemIndex" : "3", "itemName" : "Attend Wedding Ceremony"]]
    
    init() {
        self.items = Model.modelFromDictionaryArray(array: itemJSON as NSArray)
    }
    
}
