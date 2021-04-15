//
//  ViewController.swift
//  sopt_ios_1st
//
//  Created by 윤예지 on 2021/04/03.
//

import UIKit

class firstViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createId(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else {
            return
        }

        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func login(_ sender: Any) {
        
        let TabStoryboard = UIStoryboard(name: "FriendTab", bundle: nil)
        let nextVC = TabStoryboard.instantiateViewController(identifier: "FriendTabViewController")

        
        if email.text?.isEmpty == true || password.text?.isEmpty == true {
            return
        } else {
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
       
    }
    
}

