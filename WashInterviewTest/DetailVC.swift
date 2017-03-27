//
//  DetailVC.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 26..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var product: Product!
    var images = [String]()
    var infoTitle = [String]()
    var detailDescrition: String!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
//        generateTestData()
        
        infoTitle.append("Title")
        infoTitle.append("Price")
        infoTitle.append("Description")
        infoTitle.append("Detail Description")
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        
//        let totalCellWidth = collectionView.frame.size.width
//        
//        
//        let totalSpacingWidth = CellSpacing * (CellCount - 1)
//        
//        let leftInset = (100 - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
//        let rightInset = leftInset
//        
//        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
//    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardImageCell", for: indexPath) as? CardImageCell {
            
            cell.configureCell(image: self.images[indexPath.row])
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    // Content TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
        
        cell.infoTitle.text = infoTitle[indexPath.row]
    
        cell.configureCell(product: product, indexPath: indexPath)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
