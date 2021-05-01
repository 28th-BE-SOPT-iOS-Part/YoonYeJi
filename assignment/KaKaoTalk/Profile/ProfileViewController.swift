//
//  ProfileViewController.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/04/15.
//

import UIKit

class ProfileViewController: UIViewController, protocolData {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameTextView: UILabel!
    private var profileName: String?
    private var profileImageName: String?
    private var myProfileData: FriendDataModel? = FriendDataModel(imageName: "yunyeji",
                                                                 name: "윤예지",
                                                                 state: "성형 망함 ")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPanGesture()
        
        let friendTabStoryboard = UIStoryboard.init(name: "FriendTab", bundle: nil)
        let friendTabVC = friendTabStoryboard.instantiateViewController(identifier: "FriendTabViewController") as? FriendTabViewController
        
        friendTabVC?.delegate = self
        setAllData()
    

    }
    
    @IBAction func ClosedBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setAllData() {
        // HeaderView 예외 처리
        if profileName != nil {
            setProfileData(profileName: profileName!, profileImageName: profileImageName ?? "friendtabProfileImg")
        } else {
            setProfileData(profileName: myProfileData!.name, profileImageName: myProfileData?.imageName ?? "friendtabProfileImg")
        }
    }
    
    func setProfileData(profileName: String, profileImageName: String) {
        if let image = UIImage(named: profileImageName) {
            self.profileImageView?.image = image
        }
        self.profileNameTextView?.text = profileName
    }
    
}

// 팬제스처에 관한 동작 정의
extension ProfileViewController {
    
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
    
}

// 데이터 전달에 관한 동작 정의
extension ProfileViewController {
    func dataSend(profileName: String, profileImageName: String) {
        self.profileName = profileName
        self.profileImageName = profileImageName
    }
}
