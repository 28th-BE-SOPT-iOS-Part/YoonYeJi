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
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        self.makeRequestAlert(title: "알림",
                              message: "로그인을 하시겠습니까?",
                              okAction: { _ in
                                self.loginAction()
                              })
        
    }
    
    func loginAction()
    {
        LoginService.shared.login(email: self.email.text!, password: self.password.text!) { result in
            switch result {
            case .success(let message):
                let TabStoryboard = UIStoryboard(name: "FriendTab", bundle: nil)
                let nextVC = TabStoryboard.instantiateViewController(identifier: "FriendTabViewController")
                if let message = message as? String {
                    self.makeAlert(title: "알림", message: message, okAction: { _ in self.navigationController?.pushViewController(nextVC, animated: true)})
                }
                print("토큰 : " + UserDefaults.standard.string(forKey: "token")!)
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

