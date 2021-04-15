//
//  FriendTabViewController.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/04/15.
//

import UIKit

class FriendTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func profileImgClicked(_ sender: Any) {
        
        let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: nil)
        let nextVC = profileStoryboard.instantiateViewController(identifier: "ProfileViewController")
        nextVC.modalPresentationStyle = .fullScreen
        
        self.present(nextVC, animated: true, completion: nil)
       
    }
    
}
