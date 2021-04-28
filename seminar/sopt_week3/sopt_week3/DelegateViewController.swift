//
//  DelegateViewController.swift
//  sopt_week3
//
//  Created by 윤예지 on 2021/04/24.
//

import UIKit

//protocol SampleProtocol{
//    func dataSend(data : String)
//}

class DelegateViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
//    var delegate : SampleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dataSendButtonClicked(_ sender: Any) {
        
        if let text = dataTextField.text{
//            delegate?.dataSend(data: text)
            NotificationCenter.default.post(name: NSNotification.Name("sample"), object: text)
        }
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
