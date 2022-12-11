//
//  CurrencyCell.swift
//  EcbCurrencyConverter
//
//  Created by Rahul Mehndiratta on 26/11/2022.
//  Copyright © 2022 Rahul Mehndiratta. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var imgCurrency: UIImageView!
    @IBOutlet weak var lblCurrencyDescr: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
