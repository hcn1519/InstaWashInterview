//
//  CardImageCell.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 27..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class CardImageCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    
    func configureCell(image: String) {
        if let url = URL(string: image) {
            DispatchQueue.main.async {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.global().sync {
                        self.image.image = UIImage(data: data)
                    }
                } catch {}
            }
        }
    }
}
