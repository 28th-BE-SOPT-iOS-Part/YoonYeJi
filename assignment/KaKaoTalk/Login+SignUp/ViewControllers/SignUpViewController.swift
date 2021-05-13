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
        
//        let TabStoryboard = UIStoryboard(name: "FriendTab", bundle: nil)
//        let nextVC = TabStoryboard.instantiateViewController(identifier: "FriendTabViewController")
//
//
//        nextVC.modalPresentationStyle = .fullScreen
//
//        if email.text?.isEmpty == true || password.text?.isEmpty == true || checkPassword.text?.isEmpty == true {
//            return
//        } else {
//            self.present(nextVC, animated: true, completion: { self.navigationController?.popViewController(animated: true) })
//        }
        
        self.makeRequestAlert(title: "알림",
                              message: "가입 하시겠습니까?",
                              okAction: { _ in
                                self.signupAction()
                              })

    }
    
    func signupAction()
    {
        SignUpService.shared.signUp(email: self.email.text!, password: self.password.text!) { result in
            switch result {
            case .success(let message):
                let TabStoryboard = UIStoryboard(name: "FriendTab", bundle: nil)
                let nextVC = TabStoryboard.instantiateViewController(identifier: "FriendTabViewController")
                if let message = message as? String {
                    self.makeAlert(title: "알림", message: message, okAction: { _ in self.navigationController?.pushViewController(nextVC, animated: true)})
                }
            case .requestErr(let message):
                if let message = message as? String {
                    self.makeAlert(title: "알림", message: message)
                }
            default :
                print("ERROR")
            }
        }
    }

    
    
}
