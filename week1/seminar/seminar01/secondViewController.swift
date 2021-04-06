//
//  secondViewController.swift
//  seminar01
//
//  Created by 윤예지 on 2021/04/03.
//

import UIKit

class secondViewController: UIViewController {

    
    @IBOutlet weak var messageLabel: UILabel!
    
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    func setLabel()
    {
        
        if let msg = self.message
        {
            messageLabel.text = msg
        }
        
    }
    
    

    @IBAction func close(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}
