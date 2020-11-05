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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: "itemCell")
        itemTableView.dataSource = self
    }

    @IBAction func addItemAction(_ sender: Any) {
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

