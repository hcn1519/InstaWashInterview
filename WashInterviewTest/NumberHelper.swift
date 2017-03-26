//
//  NumberHelper.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 26..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import Foundation

class NumberHelper {
    static func priceWithComma(price num: Int) -> String {
        var strArray = [String]()
        let divide = num / 1000
        var result = ""
        
        strArray.append(String(divide))
        strArray.append(",")
        strArray.append("000")
        
        for i in strArray {
            result.append(i)
        }
        return result
    }
}
