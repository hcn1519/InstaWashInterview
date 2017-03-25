//
//  ViewController.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 25..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {

    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isTranslucent = false
        
        generateTestData()
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell {
            let product = productList[indexPath.row]
            
            cell.configureCell(product)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func generateTestData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        let currentDate = dateFormatter.string(from: Date())
        
        let item1 = Product(title: "silver", price: 20000, regDate: currentDate, description: "도장면, 휠, 유리 오염물 제거 및 타이어 드레싱", detailDescription: "detail Description", iconURL: "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png")
        let item2 = Product(title: "gold", price: 35000, regDate: currentDate, description: "차량의 외부만 오염된 경우, 차량의 키를 담당 테크니션님께 전달하기 어려울 때 가장 적합한 세차 상품입니다. 1. 인스타워시는 차량 각 부위별, 용도에 맞는 총 11가지의 미국 및 스위스 산 최상급 세차 원료를 사용합니다. 2. 모든 극세사 타월은 1회 사용 후 본사에서 일괄적으로 수거하여 세탁 및 관리하고, 오염된 타월은 재사용하지 않습니다. ", detailDescription: "detail Description", iconURL: "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png")
        let item3 = Product(title: "platinum", price: 50000, regDate: currentDate, description: "도장면, 휠, 유리 오염물 제거 및 타이어 드레싱", detailDescription: "detail Description", iconURL: "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png")
        
        productList.append(item1)
        productList.append(item2)
        productList.append(item3)
    }
}
