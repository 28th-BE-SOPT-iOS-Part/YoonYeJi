//
//  ProfileViewController.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/04/15.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPanGesture()
    }
    
    func setPanGesture() {
           let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureDismiss(_:)))
           view.addGestureRecognizer(panGesture)
       }
       
    @objc func panGestureDismiss(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.translation(in: view)
        let initialTouchPoint = CGPoint(x: 0, y: 0)
        
        switch sender.state {
        case .changed: // translation된 위치로 뷰를 이동시킴
            if touchPoint.y - initialTouchPoint.y > 0 {
                view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: view.frame.width, height: view.frame.height)
            }
        case .ended: // 얼마나 이동했느냐에 따라 dimiss 혹은 초기 상태로 변경
            touchPoint.y - initialTouchPoint.y > 200 ? dismiss(animated: true, completion: nil) : UIView.animate(withDuration: 0.3) { self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height) }
        default:
            break
        }
    }
    
    @IBAction func ClosedBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
