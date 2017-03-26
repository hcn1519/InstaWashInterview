//
//  ItemCell.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 25..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var iconURL: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var mainDescription: UILabel!
    
    func configureCell(_ product: Product) {
        title.text = product.title
        price.text = "₩ \(NumberHelper.priceWithComma(price: product.price))"
        mainDescription.text = product.description
        
        
        if let url = URL(string: product.iconURL) {
            
            DispatchQueue.main.async {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.global().sync {
                        self.iconURL.image = UIImage(data: data)
                    }
                } catch {}
            }
        }
    }
    
    
    
}

//extension Int {
//    func priceWithComma(price num: Int) -> String {
//        var strArray = [String]()
//        let divide = num / 1000
//        var result = ""
//        
//        strArray.append(String(divide))
//        strArray.append(",")
//        strArray.append("000")
//        
//        for i in strArray {
//            result.append(i)
//        }
//        return result
//    }
//    func priceWithComma(price num: Int) -> String {
//        var num = num
//        var result = ""
//        var numberArray = [Int]()
//        
//        while num >= 1000 {
//            let modulo = num % 1000
//            numberArray.append(modulo)
//            num /= 1000
//            
//            if num >= 1000 {
//                continue
//            }
//        }
//        numberArray.append(num)
//        
//        for (index, item) in numberArray.reversed().enumerated() {
//            result.append("\(item)")
//            
//            if index != numberArray.endIndex-1 {
//                result.append(",")
//            }
//        }
//        
//        return result
//    }
//}
