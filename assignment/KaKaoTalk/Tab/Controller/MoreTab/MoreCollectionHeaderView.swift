//
//  MoreCollectionHeaderView.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/05/02.
//

import UIKit

class MoreCollectionHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func setData(profileImage: String,
                 name: String,
                 email: String) {
        if let image = UIImage(named: profileImage) {
            profileImageView.image = image
        }
        nameLabel.text = name
        emailLabel.text = email
    }
}
