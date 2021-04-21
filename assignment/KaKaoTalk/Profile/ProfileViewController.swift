//
//  ProfileViewController.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/04/15.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var initialTouchPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPanGesture()
    }
    
    @IBAction func ClosedBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func setPanGesture() {
           let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureDismiss(_:)))
           self.view.addGestureRecognizer(panGesture)
       }
       
    @objc func panGestureDismiss(_ sender: UIPanGestureRecognizer) {
           
        let touchPoint = sender.location(in: self.view.window)
           
        if sender.state == .began {
               initialTouchPoint = touchPoint
        } else if sender.state == .changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.width, height: self.view.frame.height)
            }
        } else if sender.state == .ended || sender.state == .cancelled {
            if touchPoint.y - initialTouchPoint.y > 200 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) { self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height) }
            }
        }
    }
    
}
