//
//  SignInViewController.swift
//  sopt_ios_1st
//
//  Created by 윤예지 on 2021/04/03.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createId(_ sender: Any) {
        
        let TabStoryboard = UIStoryboard(name: "FriendTab", bundle: nil)
        let nextVC = TabStoryboard.instantiateViewController(identifier: "FriendTabViewController")
        
        
        nextVC.modalPresentationStyle = .fullScreen
        
        if email.text?.isEmpty == true || password.text?.isEmpty == true || checkPassword.text?.isEmpty == true {
            return
        } else {
            self.present(nextVC, animated: true, completion: { self.navigationController?.popViewController(animated: true) })
        }

    }
    

    
    
}
