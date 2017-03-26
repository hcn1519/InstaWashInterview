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
        
//        generateTestData()
        
        getJsonData()
        
        // tableView dynamic height
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func viewDidAppear(_ animated: Bool) {
        getJsonData()
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
    
    func getJsonData() {
        let url = URL(string: "http://demo7367352.mockable.io")
        let request = URLRequest(url: url!)
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        
        
        let task = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) in
            // 비동기방식으로 데이터 로딩
            // issue : 비동기 방식으로 데이터를 로딩해서 main thread에 있는 변수에 데이터가 저장되지 않음.
            do {
                guard let rawItem = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] else {
                    print("error trying to convert data to JSON")
                    return
                }
    
                
                if let fineItem = rawItem["goods"] as? [[String:Any]] {
                    
                    for item in fineItem {
                        let eachProduct = Product(title: "", price: 0, regDate: "", description: "", detailDescription: "", iconURL: "")
                        
                        
                        let title = item["TITLE"]
                        let price = item["PRICE"]
                        let regDate = item["REGDATE"]
                        let description = item["DESCRIPTION"]
                        let iconURL = item["ICON_URL"]
                        let images = item["IMAGES"]
                        
                        
                        if let title = title as? String {
                            eachProduct.title = title
                        }
                        if let price = price as? String {
                            eachProduct.price = Int(price)!
                        }
                        if let regDate = regDate as? String {
                            eachProduct.regDate = regDate
                        }
                        if let description = description as? String {
                            eachProduct.description = description
                        }
                        if let iconURL = iconURL as? String {
                            eachProduct.iconURL = iconURL
                        }
                        
                        if let images = images as? [String] {
                            eachProduct.images = images
                        }
                        DispatchQueue.main.async {
                            self.productList.append(eachProduct)
                            self.tableView.reloadData()
                        }
                    }
                    
                }
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
        })
        task.resume()
    }
    
// 데이터 전송 segue
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "goToProductDetail", sender: nil)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToProductDetail" {
//            if let destination = segue.destination as? DetailVC {
//                if let item = sender as? Product {
//                    let temp = Product(title: "", price: 0, regDate: "", description: "", detailDescription: "", iconURL: "")
//                    destination.product = temp
//                }
//            }
//        }
//    }
//    테스트 데이터
//    func generateTestData() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .long
//        dateFormatter.timeStyle = .long
//        let currentDate = dateFormatter.string(from: Date())
//
//        let item1 = Product(title: "silver", price: 20000, regDate: currentDate, description: "도장면, 휠, 유리 오염물 제거 및 타이어 드레싱", detailDescription: "detail Description", iconURL: "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png")
//        let item2 = Product(title: "gold", price: 35000, regDate: currentDate, description: "차량의 외부만 오염된 경우, 차량의 키를 담당 테크니션님께 전달하기 어려울 때 가장 적합한 세차 상품입니다. 1. 인스타워시는 차량 각 부위별, 용도에 맞는 총 11가지의 미국 및 스위스 산 최상급 세차 원료를 사용합니다. 2. 모든 극세사 타월은 1회 사용 후 본사에서 일괄적으로 수거하여 세탁 및 관리하고, 오염된 타월은 재사용하지 않습니다. ", detailDescription: "detail Description", iconURL: "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png")
//        let item3 = Product(title: "platinum", price: 50000, regDate: currentDate, description: "도장면, 휠, 유리 오염물 제거 및 타이어 드레싱", detailDescription: "detail Description", iconURL: "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png")
//
//        productList.append(item1)
//        productList.append(item2)
//        productList.append(item3)
//    }
}
