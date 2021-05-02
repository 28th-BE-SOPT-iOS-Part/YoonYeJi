//
//  MoreCollectionViewCell.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/05/02.
//

import UIKit

class MoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreIconImageView: UIImageView!
    
    func setData(moreIcon: String,
                 title: String) {
        if let image = UIImage(named: moreIcon) {
            moreIconImageView.image = image
        }
        titleLabel.text = title
    }
}
