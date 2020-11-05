//
//  ViewModel.swift
//  Practice-MVVM
//
//  Created by 김기현 on 2020/11/05.
//

import Foundation

protocol ReloadTableViewDelegate {
    func reloadTableView(index: Int)
}

protocol ViewModelDelegate {
    func onItemAddClick(newItem: String)
}

class ViewModel {
    
    var items: [Model] = []
    var itemJSON = [["itemIndex" : "1", "itemName" : "Washing Car"],
                    ["itemIndex" : "2", "itemName" : "Book Movie Ticket"],
                    ["itemIndex" : "3", "itemName" : "Attend Wedding Ceremony"]]
    var reloadDelegate: ReloadTableViewDelegate?
    
    init(viewDelegate: ReloadTableViewDelegate) {
        reloadDelegate = viewDelegate
        self.items = Model.modelFromDictionaryArray(array: itemJSON as NSArray)
        print("itemCount: \(items.count)")
    }
    
}

extension ViewModel: ViewModelDelegate {
    func onItemAddClick(newItem: String) {
        print("newItem: \(newItem)")
        
        let itemCount = "\(items.count + 1)"
        items.append(Model(dictionary: ["itemIndex" : itemCount, "itemName" : newItem]))
        print("itemCount: \(items.count)")
        
        guard let count = Int(itemCount) else { return }
        reloadDelegate?.reloadTableView(index: count - 1)
    }
}
