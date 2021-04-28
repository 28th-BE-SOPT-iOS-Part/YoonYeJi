//
//  FriendTableViewCell.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/04/29.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendProfileImageView: UIImageView!
    @IBOutlet weak var friendNameTextView: UILabel!
    @IBOutlet weak var friendStatusMessageTextView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
    func setData(imageName : String,
                 name : String,
                 statusMessage : String) {
        if let image = UIImage(named: imageName) {
            friendProfileImageView.image = image
        }
        friendNameTextView.text = name
        friendStatusMessageTextView.text = statusMessage
    }
    
}
