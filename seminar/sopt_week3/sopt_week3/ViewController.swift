//
//  ViewController.swift
//  sopt_week3
//
//  Created by 윤예지 on 2021/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    func dataSend(data: String) {
//        dataLabel.text = data
//    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "DelegateViewController") as? DelegateViewController else { return }
        
//        nextVC.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived), name: NSNotification.Name("sample"), object: nil)
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func dataReceived(notification: NSNotification)
    {
        if let text = notification.object as? String {
            dataLabel.text = text
        }
    }
    
}

