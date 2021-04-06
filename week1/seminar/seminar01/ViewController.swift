//
//  ViewController.swift
//  seminar01
//
//  Created by 윤예지 on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var telField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Button(_ sender: Any) {
        
        if (nameField.text != "" && telField.text != "") {
        titleLabel.text = "\(nameField.text!)의 번호는 \(telField.text!)입니다"
        } else {
            titleLabel.text = ""
        }
    }
    
}

