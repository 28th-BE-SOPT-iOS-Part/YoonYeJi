# ๐ ๋์์์ ๐

![แแชแแงแซ แแตแแฉแจ 2021-05-06 แแฉแแฅแซ 3 55 09 mov](https://user-images.githubusercontent.com/69361613/117194423-0bcaee80-ae1f-11eb-98f4-af1a670fa92d.gif)

์ด๋ฒ ๊ณผ์ ๋ ์ธ๋ฏธ๋์์ ๋ฐฐ์ด ๋ด์ฉ์ ํ ๋๋ก + ํํธ์ฅ ๊ดด๋กญํ๊ฐ๋ฉฐ + ๊ตฌ์ ์ ๋์์ผ๋ก ์ถฉ๋ถํ ํด๊ฒฐํ  ์ ์์์ด์ ~

### ๐  ๋ด ํ๋กํ / ์น๊ตฌ ๋ชฉ๋ก ๊ตฌ๋ถํ๊ธฐ ๐
์ฒ์์ ์น๊ตฌ ๋ชฉ๋ก๊ณผ ์ฌ์ด์ฆ๊ฐ ๋ค๋ฅธ ๋ด ํ๋กํ ๋ถ๋ถ์ UIView๋ก ๋นผ์ ํ์ด๋ธ๋ทฐ์ ๋ณ๊ฐ๋ก ๊ตฌํํ๋๋ฐ, ๊ทธ๋ ๊ฒ ํ๋๋ ์น๊ตฌ๋ชฉ๋ก๋ง ์คํฌ๋กค์ด ๋๋๋ผ๊ตฌ์..? ๊ทธ๋์ ์ผ์  ๋ธ์ใใ์๊ฒ ๋ฌผ์ด๋ดค๋๋ฐ ๋ ๊ฐ์ง ๋ฐฉ๋ฒ์ด ์๋ค๊ณ  ํ์ต๋๋ค. ์์ ๋ ๊ฐ ๋ง๋๋ ๋ฐฉ๋ฒ, ํน์ ํค๋๋ทฐ๋ฅผ ํตํด ๊ตฌํํ๋ ๋ฐฉ๋ฒ! ์ ๋ ํค๋๋ทฐ๋ฅผ ํตํด ๊ฐ๋จํ ๊ตฌํํด๋ณด์์ต๋๋ค. ์ ๋ ๊ฐ๋ก ํ๋ ๊ฒ๋ ํด๋ณด๋ ค๊ตฌ์ ... ์ธ์  ๊ฐ.

์ผ๋จ ์คํ ๋ฆฌ๋ณด๋ ์์์ ํ์ด๋ธ๋ทฐ ์์ UIView๋ฅผ ๋ฃ์ด์ค ํ ๋ด ํ๋กํ ๋ถ๋ถ์ ๋ง๋ค์ด์ฃผ๊ณ , ํด๋น UIView๋ฅผ IBOutlet์ผ๋ก ์ฐ๊ฒฐํด์ค ํ, ์ด๋ฅผ headerView๋ก ์ ์ธํด์ค๋๋ค.
~~~Swift
@IBOutlet weak var friendListHeaderView: UIView!
@IBOutlet weak var friendListTableView: UITableView!{
    didSet {
        friendListTableView.tableHeaderView = friendListHeaderView // ์ด ๋ถ๋ถ ์ฃผ๋ชฉ ~
        friendListTableView.delegate = self
        friendListTableView.dataSource = self
        friendListTableView.separatorStyle = .none
    }
}
~~~
โ **๊ฟํ**  
์ฌ๊ธฐ์ didSet๋ผ๋๊ฒ ์๋๋ฐ, ์ด๊ฒ ๋ญ๋๋ฉด Property Observer๋ก์, ํ๋กํผํฐ ๊ฐ์ ๋ณ๊ฒฝ ์ง์ ์ ๋ํ ์ด๋ฒคํธ๋ฅผ ๊ฐ์งํ๋ฉฐ ํด๋น ์์ ์ ์์์ ์ํํ  ์ ์๋๋ก ํ๋ ๊ธฐ๋ฅ์ ์ง์ํ๋ค๊ณ  ํฉ๋๋ค. ์ด๋ ๊ฒ ํ๋ฉด ViewDidLoad์ tableView์ ๋ํ ์ฝ๋๋ฅผ ์ ์ง ์์๋ ๋ฉ๋๋ค.  
๊ทผ๋ฐ ๊ฐ์ด ์ธ์  ๋ณ๊ฒฝ ๋๊ธธ๋ ์ด๊ฒ ์คํ๋๋๊ฑฐ์ง..? ํ๋ ๊ถ๊ธ์ฆ์ด ์๊ฒจ์ ์ฐพ์๋ดค๋๋ฐ, Outlet ํ๋กํผํฐ๋ ์ฒ์์ ํด๋์ค๊ฐ ์์ฑ๋  ๋ nil๋ก์จ ์ด๊ธฐํ๋๊ณ , ์ดํ ๊ฐ์ฒด๋ค์ด nib์ผ๋ก๋ถํฐ ๋ถ๋ ค์์ง ๋ ํ๋กํผํฐ๋ค์ด ๊ฐ์ ๊ฐ๊ฒ ๋๋ค๊ณ  ํฉ๋๋ค. ๋ฐ๋ผ์ ์ด๋ ๊ฒ ์ฒ์์ nil์ด์๋ IBOutlet์ด ๊ฐ์ ๊ฐ๊ฒ ๋ ๊ฒ์ ๋ณ๊ฒฝ์ผ๋ก ๊ฐ์งํด์ didSet ์์ ์์๋ค์ด ์คํ๋๊ฒ ๋๋ ๊ฒ์ด์ฃ ~ (๋ง๊ฒ ์ง?)

### ๐ ์ปฌ๋ ์๋ทฐ ํค๋์ ์ปฌ๋ ์๋ทฐ ๋ง์ง๊ฐ ๋ค๋ฅด๊ฒ ์ฃผ๊ธฐ ๐
์ปฌ๋ ์๋ทฐ์์๋ ๋ด ํ๋กํ ์ฌ์ง, ์ด๋ฆ, ์ด๋ฉ์ผ ๋ถ๋ถ์ ํค๋๋ทฐ(CollectionReusableView ์ด์ฉ)๋ก ๊ตฌํ์ ํ๋๋ฐ, ๋ด ํ๋กํ ๋ถ๋ถ์ ๋ง์ง์ 13์ธ ๋ฐ๋ฉด ์ปฌ๋ ์๋ทฐ์ ๋ง์ง์ 19์ฌ์ ๋์ ๋ง์ง์ ๋ค๋ฅด๊ฒ ์ค์ผํ์ต๋๋ค~ ์คํ ๋ฆฌ๋ณด๋ ์์์๋ ์ ์๋ผ์ ์ฌ๋ฌ ๋ฐฉ๋ฒ์ ์ฐพ์๋ณด๋ค๊ฐ..
๊ฒฐ๋ก ์ ์ปฌ๋ ์๋ทฐ์ UIEdgeInsets์ ํตํด ํด๊ฒฐํ  ์ ์์์ต๋๋ค! (shout out to ์ผ์  ๋ธ์..)
~~~Swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 19)
}
~~~
UIEdgeInsets์ Header ํน์ Footer์๋ ๋ณ๊ฐ๋ผ์ ์๋ฐ ์์ผ๋ก ๊ฐ์ ์ฃผ๋ฉด Header์ Footer๋ฅผ ์ ์ธํ ์ปฌ๋ ์๋ทฐ์๋ง ๋ง์ง์ด ๋ค์ด๊ฐ๋๋ค. ์๋ ์ฌ์ง ์ฐธ์กฐ~
![image](https://user-images.githubusercontent.com/69361613/117202131-6d438b00-ae28-11eb-959a-c21de687f432.png)

### ๐ ๋์ ๊ณผ์  1 - ์ก์ ์ํธ ๐
์๊ฑด ์๊ฐ๋ณด๋ค ๊ฐ๋จํ์ต๋๋ค~ UIAlertController๋ฅผ ํตํด ๋ง๋ค์ด ์ค ์ ์์์ต๋๋ค.  
UIAlertController์ preferredStyle์ actionSheet๋ก ์ ์ธํด์ฃผ๊ณ  (๋ง์ฝ alert๋ก ์ ์ธํด์ฃผ๋ฉด ํ์์ฐฝ ํํ๋ก ๊ฒฝ๊ณ  ๋ฉ์ธ์ง๋ฅผ ์ค ์ ์์ด์) addAction ๋ฉ์๋๋ฅผ ํตํด ํญ๋ชฉ๋ค์ ์ถ๊ฐํ๋ฉด ๋ฉ๋๋ค. 
~~~Swift
let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
actionSheet.addAction(UIAlertAction(title: "ํธ์ง", style: .default, handler: nil ))
actionSheet.addAction(UIAlertAction(title: "์น๊ตฌ ๊ด๋ฆฌ", style: .default, handler: nil ))
actionSheet.addAction(UIAlertAction(title: "์ ์ฒด ์ค์ ", style: .default, handler: nil ))
actionSheet.addAction(UIAlertAction(title: "์ทจ์", style: .cancel, handler: nil ))
self.present(actionSheet, animated: true, completion: nil)
~~~
addAction์ UIAlertAction ๋ฉ์๋๋ฅผ ์ถ๊ฐํด์ค ๋ style ๋ถ๋ถ์๋ .default, .destructive, .cancel ์ด๋ ๊ฒ ์ธ ๊ฐ์ง ํญ๋ชฉ์ ๋ฃ์ด์ค ์ ์๋๋ฐ, default๋ ๊ธฐ๋ณธ์ ์ธ ์คํ์ผ ํญ๋ชฉ์ด๊ณ , destructive๋ ํด๋น ํญ๋ชฉ์ ์ ํํ  ์ ๋ฐ์ดํฐ๊ฐ ๋ณ๊ฒฝ๋๊ฑฐ๋ ์ญ์ ํ์ฌ ๋์ดํฌ ์ ์๋ ์ํฉ์ด ๋  ์ ์์์ ๋ํ๋ด๊ธฐ ์ํ ๊ฐ์กฐ์ ์๋ฏธ๋ก ๋นจ๊ฐ์์ผ๋ก ํํ๋ฉ๋๋ค.

### ๐ ๋์ ๊ณผ์  2 - ํ์ด๋ธ๋ทฐ ์์ผ๋ก ์ฌ๋ผ์ด๋ ์ ์จ๊น/์ฐจ๋จ ๋ฒํผ ๋์ค๊ฒ! ๐
์ด ๊ฒ๋ ๊ธฐ๋ณธ์ ์ผ๋ก tableView ๋ฉ์๋๊ฐ ์ ์๋์ด์์ด์ ๊ฐ๋จํ๊ฒ ๊ตฌํํ  ์ ์์์ต๋๋ค. 
~~~Swift
func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
~~~
์ฐ๋ฆฌ๋ ์ผ์ชฝ์์ ์ฌ๋ผ์ด๋๋ฅผ ์์ํ ๊ฑฐ๊ธฐ ๋๋ฌธ์ trailingSwipeActionsConfigurationForRowAt ๋ฅผ ์จ์ค ๊ฒ์ด๊ณ , ๋ง์ฝ ์ค๋ฅธ์ชฝ์์ ์ฌ๋ผ์ด๋๋ฅผ ์์ํ๊ณ  ์ถ์ผ๋ฉด leadingSwipeActionsConfigurationForRowAt์ ์ฌ์ฉํด์ฃผ๋ฉด ๋ฉ๋๋ค.
UIContextualAction ์ ํตํด ์ํํ๋ ค๋ ๋์์ ๋ง๋ค๊ณ , ์ด๋ฌํ ๋์๋ค์ UISwipeActionsConfiguration์ ์ถ๊ฐํด์ฃผ๋ฉด ๋ฉ๋๋ค.
~~~Swift
func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
    let blockAction = UIContextualAction(style: .destructive, title: "์ฐจ๋จ") { (_, _, _) in  }
    let hideAction = UIContextualAction(style: .normal, title: "์จ๊น") { (_, _, _) in  }
    hideAction.backgroundColor = .darkGray
        
    let config = UISwipeActionsConfiguration(actions: [blockAction, hideAction])
    config.performsFirstActionWithFullSwipe = false
        
    return config
}
~~~
์ค์  ์ฐจ๋จ, ์จ๊น์ ๊ดํ ๋์์ ํด๋ก์  ์์ ์ ์ํด์ฃผ๋ฉด ๋ฉ๋๋ค! ์ฐ๋ฆฌ๋ ์ผ๋จ ๋ชจ์๋ง ๊ตฌํํ ๊ฑฐ๋๊น ๋น์์ง ์ํ์๋๋ค. ์ฌ๊ธฐ์ config.performsFirstActionWithFullSwipe = false ๋ผ๋๊ฒ ์๋๋ฐ, ์ด๊ฒ ๋ญ๋๋ฉด ์ฌ๋ผ์ด๋๋ฅผ ๋๊น์ง ํด์ฃผ์์ ๋ ์ฒซ๋ฒ์งธ ๋์ (๋ง์ฝ ์จ๊น/์ฐจ๋จ ์์ผ๋ก ์์ผ๋ฉด, ์จ๊น ๋์)์ด ์คํ๋๋๋ก ํ๋ ๊ฑด๋ฐ(true์ผ ๋) ์ด๊ฑธ ๋ง์์ฃผ๊ธฐ ์ํด์ false ๊ฐ์ ์ค๊ฒ๋๋ค.


### ๐ ๋์ ๊ณผ์  3 - ๊พน ๋๋ฅด๋ฉด ๋ฏธ๋ฆฌ๋ณด๊ธฐ ๐
์ ๊ฒ๋ ๋ง์ฐฌ๊ฐ์ง๋ก tableView ๋ฉ์๋๊ฐ ์ ์๋์ด ์์ต๋๋ค.
~~~Swift
func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration?
~~~
UIContextMenuConfiguration์ด๋ผ๋ ๊ฑธ๋ก ๊ตฌํ์ ํด์ค๋๋ค. identifier, previewProvider, actionProvider๋ผ๋ ๋งค๊ฐ๋ณ์๋ก ๊ตฌ์ฑ๋์ด์๋๋ฐ, previewProvider์์๋ ๋ฏธ๋ฆฌ๋ณด๊ธฐ ํ๋ฉด์ ๋ํ ๋์์ ์ ์ํ๊ณ , actionProvider์๋ ๋ฏธ๋ฆฌ๋ณด๊ธฐ ๋ฐ์ ๋ฉ๋ด ํญ๋ชฉ๋ค์ ๊ตฌ์ฑํ๊ธฐ ์ํ ๋์์ ์ ์ํฉ๋๋ค.  
์ฐ๋ฆฌ๋ ๋ฏธ๋ฆฌ๋ณด๊ธฐ ํ๋ฉด์์ Profile ๋ถ๋ถ์ ๋ํด ๋ณด์ฌ์ค ๊ฑฐ๊ธฐ ๋๋ฌธ์, previewProvider์ ๋ฐํ๊ฐ์ผ๋ก profileVC ์ธ์คํด์ค ๊ฐ์ ๋ฐํํด์ค๋๋ค. ๋ํ ๋ฐ์ดํฐ ์ ๋ฌ๋ ์๋์ผ๋ก ๋๋๊ฒ ์๋๊ธฐ ๋๋ฌธ์ ์ฌ๊ธฐ์ ๋ ๋ฐ์ดํฐ ์ ๋ฌ์ ๊ดํ ๋์์ ์ ์ํด์ค์ผ ํฉ๋๋ค. ๊ทธ๋ ์ง ์์ผ๋ฉด ๊ธฐ๋ณธ์ผ๋ก ๊ตฌ์ฑ๋์ด์๋ ํ๋ฉด์ด ๋์์!  
๋ฏธ๋ฆฌ๋ณด๊ธฐ ํ๋ฉด ๋ฐ์ ๋ฉ๋ด๋ค์ UIAction๋ฅผ ํตํด ํญ๋ชฉ๋ค์ ์์ฑํ๊ณ , ์ด๋ฅผ UIMenu ํจ์์ ๋๊ฒจ์ฃผ๋ ๋ฐฉ์์ผ๋ก ์์ฑ์ด ๋ฉ๋๋ค.
~~~Swift
func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
    let config = UIContextMenuConfiguration(identifier: nil, previewProvider: { () -> UIViewController? in
        let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: nil)
        let profileVC = profileStoryboard.instantiateViewController(identifier: "ProfileViewController")
        self.delegate = profileVC as? protocolData
        self.delegate?.dataSend(profileName: friendList[indexPath.row].name, profileImageName: friendList[indexPath.row].imageName)
        return profileVC
    }) { _ in
        let chatting = UIAction(title: "์ฑํํ๊ธฐ") { _ in }
        let voiceTalk = UIAction(title: "๋ณด์ด์คํก") { _ in }
        let faceTalk = UIAction(title: "ํ์ด์คํก") { _ in }
        let gift = UIAction(title: "์ ๋ฌผํ๊ธฐ") { _ in }
        return UIMenu(title: "", children: [chatting, voiceTalk, faceTalk, gift])
    }
    return config
}
~~~
