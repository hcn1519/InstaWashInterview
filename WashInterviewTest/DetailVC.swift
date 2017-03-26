//
//  DetailVC.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 26..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var product: Product!
    var images = [String]()
    var infoTitle = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        generateTestData()
        
        infoTitle.append("Title")
        infoTitle.append("Price")
        infoTitle.append("Description")
        infoTitle.append("Detail Description")
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // Content TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (images.count + 4)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
            
            cell.configureCell(image: images[indexPath.row])
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
            
            cell.infoTitle.text = infoTitle[indexPath.row - 3]
        
            if indexPath.row == 3 {
                cell.infoDetail.text = product.title
            } else if indexPath.row == 4 {
                cell.infoDetail.text = "₩ \(NumberHelper.priceWithComma(price: product.price))"
            } else if indexPath.row == 5 {
                cell.infoDetail.text = product.description
            } else if indexPath.row == 6 {
                cell.infoDetail.text = product.detailDescription
            }
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2{
            return 120
        }
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func generateTestData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        let currentDate = dateFormatter.string(from: Date())

        let item1 = Product(title: "silver", price: 20000, regDate: currentDate, description: "도장면, 휠, 유리 오염물 제거 및 타이어 드레싱", detailDescription: "차량의 외부만 오염된 경우, 차량의 키를 담당 테크니션님께 전달하기 어려울 때 가장 적합한 세차 상품입니다. 1. 인스타워시는 차량 각 부위별, 용도에 맞는 총 11가지의 미국 및 스위스 산 최상급 세차 원료를 사용합니다. 2. 모든 극세사 타월은 1회 사용 후 본사에서 일괄적으로 수거하여 세탁 및 관리하고, 오염된 타월은 재사용하지 않습니다. 3. 인스타워시의 모든 테크니션들은 *IPAA의 매뉴얼화된 전문 디테일링 교육을 통해 양성되며, IPAA level 2 과정 이상을 수료한 전문 테크니션만이 서비스 현장에 투입되어 고객님의 차량을 관리합니다. *IPAA : Instawash Professional Autocare Academy. [작업 부위] <실외> - 보닛 - 프런트 마스크(자동차 앞면 전체 = 헤드램프, 그릴, 번호판, 범퍼) - 루프 (프론트 헤더, 헤더, 리어 헤더) - 프런트 필러(A필러), 센터 필러(B필러), 리어필러(C필러) - 모든 유리와 와이퍼 - 사이드 미러 - 도어(운전석, 조수석, 뒷좌석) - 로커 패널 (운전석, 조수석) - 앞, 뒤 펜더 - 휠과 타이어 - 리어 마스크(테일램프, 트렁크, 번호판, 범퍼) - 트렁크 리드 - 디퓨저 - 테일파이프", iconURL: "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png")
        
        images = ["https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png",
        "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png",
        "https://s3.ap-northeast-2.amazonaws.com/interview-instawash/goods/icon_service_silver%402x.png"
        ]
        product = item1
    }
    
    
    // image CollectionView
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 3
    //    }
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return 1
    //    }
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell {
    //            let image = images[indexPath.row]
    //
    //            cell.configureCell(image: image)
    //            return cell
    //        } else {
    //            return UICollectionViewCell()
    //        }
    //    }

}
