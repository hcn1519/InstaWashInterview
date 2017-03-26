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
        
        getJsonData()
        
        // tableView dynamic height
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
   
    
    // parsing
    func getJsonData() {
        let url = URL(string: "http://demo7367352.mockable.io")
        let request = URLRequest(url: url!)
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        
        
        let task = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) in
            // 비동기방식으로 데이터 로딩
            do {
                guard let data = data, error == nil else {
                    print("network request failed: error = \(error)")
                    return
                }
                guard let rawItem = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    print("error trying to convert data to JSON")
                    return
                }
                guard let fineItem = rawItem["goods"] as? [[String:Any]] else {
                    print("goods not found or wrong type")
                    return
                }
                    
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
                    self.productList.append(eachProduct)
                }
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })

            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
        })
        task.resume()
    }
    
// 데이터 전송 segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProductDetail" {
            if let controller = segue.destination as? DetailVC, let indexPath = tableView.indexPathForSelectedRow {
                controller.product = productList[indexPath.row]
            }
        }
    }
}
