//
//  FriendTabViewController.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/04/15.
//

import UIKit

protocol protocolData {
    func dataSend(profileName: String, profileImageName: String)
}

class FriendTabViewController: UIViewController {
    // MARK:- Variable Parts
    var delegate : protocolData?
    static let identifier : String = "FriendTabViewController"

    //MARK:- @IBoutlet Parts
    @IBOutlet weak var friendListTableView: UITableView!{
        didSet {
            friendListTableView.tableHeaderView = friendListHeaderView
            friendListTableView.delegate = self
            friendListTableView.dataSource = self
            friendListTableView.separatorStyle = .none
        }
    }
    @IBOutlet weak var friendListHeaderView: UIView!
    
    //MARK:- Life Cycle Parts
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func profileImgClicked(_ sender: Any) {
        let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: nil)
        let profileVC = profileStoryboard.instantiateViewController(identifier: "ProfileViewController")
        profileVC.modalPresentationStyle = .overFullScreen
    
        self.present(profileVC, animated: true, completion: nil)
    }
    
    
    @IBAction func showActionSheet(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "편집", style: .default, handler: nil ))
        actionSheet.addAction(UIAlertAction(title: "친구 관리", style: .default, handler: nil ))
        actionSheet.addAction(UIAlertAction(title: "전체 설정", style: .default, handler: nil ))
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil ))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}

extension FriendTabViewController : UITableViewDelegate {
    // TableViewCell 간격 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 50
    }
    
    // TableViewCell 클릭시 화면 전환
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: nil)
        let profileVC = profileStoryboard.instantiateViewController(identifier: ProfileViewController.identifier)
        
        profileVC.modalPresentationStyle = .overFullScreen
        self.delegate = profileVC as? protocolData

        self.delegate?.dataSend(profileName: friendList[indexPath.row].name, profileImageName: friendList[indexPath.row].imageName)
        self.present(profileVC, animated: true, completion: nil)
    }
    
    // 테이블뷰 스와이프해서 숨김, 차단
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let blockAction = UIContextualAction(style: .destructive, title: "차단") { (_, _, _) in  }
        let hideAction = UIContextualAction(style: .normal, title: "숨김") { (_, _, _) in  }
        hideAction.backgroundColor = .darkGray
        
        let config = UISwipeActionsConfiguration(actions: [blockAction, hideAction])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    // 테이블뷰 꾹 누르면 미리 보기
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: { () -> UIViewController? in
            let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: nil)
            let profileVC = profileStoryboard.instantiateViewController(identifier: "ProfileViewController")
            self.delegate = profileVC as? protocolData
            self.delegate?.dataSend(profileName: friendList[indexPath.row].name, profileImageName: friendList[indexPath.row].imageName)
            return profileVC
        }) { _ in
            let chatting = UIAction(title: "채팅하기") { _ in }
            let voiceTalk = UIAction(title: "보이스톡") { _ in }
            let faceTalk = UIAction(title: "페이스톡") { _ in }
            let gift = UIAction(title: "선물하기") { _ in }
            return UIMenu(title: "", children: [chatting, voiceTalk, faceTalk, gift])
        }
        return config
    }


}

extension FriendTabViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath)
                as? FriendTableViewCell else { return UITableViewCell() }

        friendCell.setData(imageName: friendList[indexPath.row].imageName,
                           name: friendList[indexPath.row].name,
                           statusMessage: friendList[indexPath.row].state)

        return friendCell
    }
}

