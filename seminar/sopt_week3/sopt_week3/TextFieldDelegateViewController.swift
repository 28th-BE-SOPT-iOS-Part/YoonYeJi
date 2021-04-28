//
//  SecondViewController.swift
//  sopt_week3
//
//  Created by 윤예지 on 2021/04/24.
//

import UIKit

class TextFieldDelegateViewController: UIViewController {

    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleTextField.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension TextFieldDelegateViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sampleLabel.text = sampleTextField.text
        
        return true
    }
    
}
