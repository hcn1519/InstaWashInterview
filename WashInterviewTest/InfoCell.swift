//
//  InfoCell.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 26..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoDetail: UILabel!
    
    func configureCell(product: Product, indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            infoDetail.text = product.title
        } else if indexPath.row == 1 {
            infoDetail.text = "₩ \(NumberHelper.priceWithComma(price: product.price))"
        } else if indexPath.row == 2 {
            infoDetail.text = product.description
        } else if indexPath.row == 3 {
            infoDetail.text = product.detailDescription
        }
    }
}

