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
    
    static let identifier : String = "FriendTabViewController"

    @IBOutlet weak var friendListTableView: UITableView!
    @IBOutlet weak var friendListHeaderView: UIView!
    var delegate : protocolData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendListTableView.tableHeaderView = friendListHeaderView
        friendListTableView.delegate = self
        friendListTableView.dataSource = self
        friendListTableView.separatorStyle = .none
    }
    
    @IBAction func profileImgClicked(_ sender: Any) {
        let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: nil)
        let profileVC = profileStoryboard.instantiateViewController(identifier: "ProfileViewController")
        profileVC.modalPresentationStyle = .overFullScreen
    
        self.present(profileVC, animated: true, completion: nil)
       
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
        let profileVC = profileStoryboard.instantiateViewController(identifier: "ProfileViewController")
        
        profileVC.modalPresentationStyle = .overFullScreen
        self.delegate = profileVC as? protocolData

        self.delegate?.dataSend(profileName: friendList[indexPath.row].name, profileImageName: friendList[indexPath.row].imageName)
        self.present(profileVC, animated: true, completion: nil)
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

