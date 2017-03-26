//
//  Product.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 25..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import Foundation

class Product {
    private var _title: String!
    private var _price: Int!
    private var _regDate: String!
    private var _description: String!
    private var _detailDescription: String!
    private var _iconURL: String!
    private var _images = [String]()
    
    // constructor
    init(title: String, price: Int, regDate: String, description: String, detailDescription: String, iconURL: String) {
        self._title = title
        self._price = price
        self._regDate = regDate
        self._description = description
        self._detailDescription = detailDescription
        self._iconURL = iconURL
    }
    
    // computed property, getter & setter
    var title: String {
        get {
            return self._title
        } set {
            self._title = newValue
        }
    }
    var price: Int {
        get {
            return self._price
        } set {
            self._price = newValue
        }
    }
    // date를 String으로 저장
    var regDate: String {
        get {
            return self._regDate
        } set {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .long
            let currentDate = dateFormatter.string(from: Date())
            self._regDate = "\(currentDate)"
        }
    }
    var description: String {
        get {
            return self._description
        } set {
            self._description = newValue
        }
    }
    var detailDescription: String {
        get {
            return self._detailDescription
        } set {
            self._detailDescription = newValue
        }
    }
    
    var iconURL: String {
        get {
            return self._iconURL
        } set {
            self._iconURL = newValue
        }
    }
    var images: [String] {
        get {
            return self._images
        } set {
            self._images = newValue
        }
    }
}
