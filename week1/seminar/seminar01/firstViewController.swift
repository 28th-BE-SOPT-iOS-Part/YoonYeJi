//
//  firstViewController.swift
//  seminar01
//
//  Created by 윤예지 on 2021/04/03.
//

import UIKit

class firstViewController: UIViewController {

   
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func move(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "secondViewController") as? secondViewController else {
            return
        }
        
        nextVC.message = messageTextField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
//        nextVC.modalTransitionStyle = .coverVertical
//        nextVC.modalPresentationStyle = .fullScreen
        
//        self.present(nextVC, animated: true, completion: nil)
    }
    
}
