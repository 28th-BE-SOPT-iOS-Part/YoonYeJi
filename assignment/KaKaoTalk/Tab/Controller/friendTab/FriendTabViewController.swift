//
//  FriendTabViewController.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/04/15.
//

import UIKit

class FriendTabViewController: UIViewController {

    @IBOutlet weak var friendListTableView: UITableView!
    @IBOutlet weak var friendListHeaderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendListTableView.tableHeaderView = friendListHeaderView
        friendListTableView.delegate = self
        friendListTableView.dataSource = self
        friendListTableView.separatorStyle = .none
    }
    
    @IBAction func profileImgClicked(_ sender: Any) {
        let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: nil)
        let nextVC = profileStoryboard.instantiateViewController(identifier: "ProfileViewController")
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
       
    }
    

}

extension FriendTabViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 50
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
