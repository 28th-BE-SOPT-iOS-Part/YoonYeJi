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
    @IBOutlet weak var checkpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createId(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "CheckViewController") as? CheckViewController else {
            return
        }
        
        nextVC.name = email.text
        nextVC.modalPresentationStyle = .fullScreen
        
        if email.text?.isEmpty == true || password.text?.isEmpty == true || checkpassword.text?.isEmpty == true {
            return
        } else {
            self.present(nextVC, animated: true, completion: { self.navigationController?.popViewController(animated: true) })
        }

    }
    

    
    
}
