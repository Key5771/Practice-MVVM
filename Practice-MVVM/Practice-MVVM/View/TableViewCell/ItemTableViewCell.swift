//
//  ItemTableViewCell.swift
//  Practice-MVVM
//
//  Created by 김기현 on 2020/11/05.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemIndexLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupDataFromModel(model: Model) {
        self.itemNameLabel.text = model.itemName
        self.itemIndexLabel.text = model.itemIndex
    }
}
