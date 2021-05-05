# 🐙 동작영상 🐙

![화면 기록 2021-05-06 오전 3 55 09 mov](https://user-images.githubusercontent.com/69361613/117194423-0bcaee80-ae1f-11eb-98f4-af1a670fa92d.gif)

이번 과제는 세미나에서 배운 내용을 토대로 + 파트장 괴롭혀가며 + 구선생 도움으로 충분히 해결할 수 있었어요 ~

### 🌀  내 프로필 / 친구 목록 구분하기 🌀
처음에 친구 목록과 사이즈가 다른 내 프로필 부분을 UIView로 빼서 테이블뷰와 별개로 구현했는데, 그렇게 했더니 친구목록만 스크롤이 되더라구요..? 그래서 염전 노예ㅋㅋ에게 물어봤는데 두 가지 방법이 있다고 했습니다. 셀을 두 개 만드는 방법, 혹은 헤더뷰를 통해 구현하는 방법! 저는 헤더뷰를 통해 간단히 구현해보았습니다. 셀 두 개로 하는 것도 해보려구요 ... 언젠가.

일단 스토리보드 상에서 테이블뷰 안에 UIView를 넣어준 후 내 프로필 부분을 만들어주고, 해당 UIView를 IBOutlet으로 연결해준 후, 이를 headerView로 선언해줍니다.
~~~Swift
@IBOutlet weak var friendListHeaderView: UIView!
@IBOutlet weak var friendListTableView: UITableView!{
    didSet {
        friendListTableView.tableHeaderView = friendListHeaderView // 이 부분 주목 ~
        friendListTableView.delegate = self
        friendListTableView.dataSource = self
        friendListTableView.separatorStyle = .none
    }
}
~~~
✅ **꿀팁**  
여기서 didSet라는게 있는데, 이게 뭐냐면 Property Observer로서, 프로퍼티 값의 변경 직전에 대한 이벤트를 감지하며 해당 시점에 작업을 수행할 수 있도록 하는 기능을 지원한다고 합니다. 이렇게 하면 ViewDidLoad에 tableView에 대한 코드를 적지 않아도 됩니다.  
근데 값이 언제 변경 됐길래 이게 실행되는거지..? 하는 궁금증이 생겨서 찾아봤는데, Outlet 프로퍼티는 처음에 클래스가 생성될 때 nil로써 초기화되고, 이후 객체들이 nib으로부터 불려와질 때 프로퍼티들이 값을 갖게 된다고 합니다. 따라서 이렇게 처음에 nil이었던 IBOutlet이 값을 갖게 된 것을 변경으로 감지해서 didSet 안의 요소들이 실행되게 되는 것이죠~ (맞겠지?)

### 🌀 컬렉션뷰 헤더와 컬렉션뷰 마진값 다르게 주기 🌀
컬렉션뷰에서도 내 프로필 사진, 이름, 이메일 부분을 헤더뷰(CollectionReusableView 이용)로 구현을 했는데, 내 프로필 부분의 마진은 13인 반면 컬렉션뷰의 마진은 19여서 둘의 마진을 다르게 줘야했습니다~ 스토리보드 상에서는 잘 안돼서 여러 방법을 찾아보다가..
결론은 컬렉션뷰의 UIEdgeInsets을 통해 해결할 수 있었습니다! (shout out to 염전 노예..)
~~~Swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 19)
}
~~~
UIEdgeInsets은 Header 혹은 Footer와는 별개라서 요런 식으로 값을 주면 Header와 Footer를 제외한 컬렉션뷰에만 마진이 들어갑니다. 아래 사진 참조~
![image](https://user-images.githubusercontent.com/69361613/117202131-6d438b00-ae28-11eb-959a-c21de687f432.png)

### 🌀 도전과제 1 - 액션 시트 🌀
요건 생각보다 간단했습니다~ UIAlertController를 통해 만들어 줄 수 있었습니다.  
UIAlertController의 preferredStyle을 actionSheet로 선언해주고 (만약 alert로 선언해주면 팝업창 형태로 경고 메세지를 줄 수 있어요) addAction 메서드를 통해 항목들을 추가하면 됩니다. 
~~~Swift
let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
actionSheet.addAction(UIAlertAction(title: "편집", style: .default, handler: nil ))
actionSheet.addAction(UIAlertAction(title: "친구 관리", style: .default, handler: nil ))
actionSheet.addAction(UIAlertAction(title: "전체 설정", style: .default, handler: nil ))
actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil ))
self.present(actionSheet, animated: true, completion: nil)
~~~
addAction에 UIAlertAction 메서드를 추가해줄 때 style 부분에는 .default, .destructive, .cancel 이렇게 세 가지 항목을 넣어줄 수 있는데, default는 기본적인 스타일 항목이고, destructive는 해당 항목을 선택할 시 데이터가 변경되거나 삭제하여 돌이킬 수 없는 상황이 될 수 있음을 나타내기 위한 강조의 의미로 빨간색으로 표현됩니다.

### 🌀 도전과제 2 - 테이블뷰 옆으로 슬라이드 시 숨김/차단 버튼 나오게! 🌀
이 것도 기본적으로 tableView 메서드가 정의되어있어서 간단하게 구현할 수 있었습니다. 
~~~Swift
func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
~~~
우리는 왼쪽에서 슬라이드를 시작할거기 때문에 trailingSwipeActionsConfigurationForRowAt 를 써준 것이고, 만약 오른쪽에서 슬라이드를 시작하고 싶으면 leadingSwipeActionsConfigurationForRowAt을 사용해주면 됩니다.
UIContextualAction 을 통해 수행하려는 동작을 만들고, 이러한 동작들을 UISwipeActionsConfiguration에 추가해주면 됩니다.
~~~Swift
func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
    let blockAction = UIContextualAction(style: .destructive, title: "차단") { (_, _, _) in  }
    let hideAction = UIContextualAction(style: .normal, title: "숨김") { (_, _, _) in  }
    hideAction.backgroundColor = .darkGray
        
    let config = UISwipeActionsConfiguration(actions: [blockAction, hideAction])
    config.performsFirstActionWithFullSwipe = false
        
    return config
}
~~~
실제 차단, 숨김에 관한 동작은 클로저 안에 정의해주면 됩니다! 우리는 일단 모양만 구현할거니까 비워진 상태입니다. 여기서 config.performsFirstActionWithFullSwipe = false 라는게 있는데, 이게 뭐냐면 슬라이드를 끝까지 해주었을 때 첫번째 동작 (만약 숨김/차단 순으로 있으면, 숨김 동작)이 실행되도록 하는 건데(true일 때) 이걸 막아주기 위해서 false 값을 준겁니다.


### 🌀 도전과제 3 - 꾹 누르면 미리보기 🌀
요 것도 마찬가지로 tableView 메서드가 정의되어 있습니다.
~~~Swift
func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration?
~~~
UIContextMenuConfiguration이라는 걸로 구현을 해줍니다. identifier, previewProvider, actionProvider라는 매개변수로 구성되어있는데, previewProvider에서는 미리보기 화면에 대한 동작을 정의하고, actionProvider에는 미리보기 밑에 메뉴 항목들을 구성하기 위한 동작을 정의합니다.  
우리는 미리보기 화면에서 Profile 부분에 대해 보여줄 거기 때문에, previewProvider의 반환값으로 profileVC 인스턴스 값을 반환해줍니다. 또한 데이터 전달도 자동으로 되는게 아니기 때문에 여기서 또 데이터 전달에 관한 동작을 정의해줘야 합니다. 그렇지 않으면 기본으로 구성되어있는 화면이 나와요!  
미리보기 화면 밑의 메뉴들은 UIAction를 통해 항목들을 생성하고, 이를 UIMenu 함수에 넘겨주는 방식으로 생성이 됩니다.
~~~Swift
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
~~~
