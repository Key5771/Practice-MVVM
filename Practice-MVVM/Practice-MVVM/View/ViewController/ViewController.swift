//
//  ViewController.swift
//  Practice-MVVM
//
//  Created by 김기현 on 2020/11/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemTableView: UITableView!
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: "itemCell")
        itemTableView.dataSource = self
    }

    @IBAction func addItemAction(_ sender: Any) {
        guard let viewModel = self.viewModel, let text = self.itemTextField.text else { return }
        viewModel.onItemAddClick(newItem: text)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 1 }
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        guard let viewModel = self.viewModel else {
            fatalError("ViewModel is nil")
        }
        
        cell.setupDataFromModel(model: viewModel.items[indexPath.row])
        
        return cell
    }
}

