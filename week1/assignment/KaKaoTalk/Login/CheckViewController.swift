//
//  CheckViewController.swift
//  sopt_ios_1st
//
//  Created by 윤예지 on 2021/04/03.
//

import UIKit

class CheckViewController: UIViewController {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
    }
    
    func setLabel() {
        if let msg = self.name
        {
            nameLabel.text = "\(msg)님 \n가입이 완료되었습니다"
        }
    }

    @IBAction func check(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "friendTabViewController") as? friendTabViewController else {
            return
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)

        
    }
}
