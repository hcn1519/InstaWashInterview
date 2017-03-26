//
//  ImageCell.swift
//  WashInterviewTest
//
//  Created by 홍창남 on 2017. 3. 26..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet var detailImage: UIImageView!
    
    func configureCell(image: String) {
        if let url = URL(string: image) {
            DispatchQueue.main.async {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.global().sync {
                        self.detailImage.image = UIImage(data: data)
                    }
                } catch {}
            }
        }
    }
}
