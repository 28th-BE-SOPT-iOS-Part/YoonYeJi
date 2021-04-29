![3__1](https://user-images.githubusercontent.com/69361613/116546390-8205b780-a92c-11eb-80cf-e6b1e921741b.png)

**4/24 3차 세미나** 강남역스터디룸 1호점 윤서,루희,예지 + zzangs ~~ 

## 데이터 전달

데이터 전달 방식에는 크게 두 가지가 있습니다.
1. A 뷰컨에서 B 뷰컨으로 데이터를 직접 넘겨주는 **<직접 전달 방식>**
- present / push 시 프로퍼티에 접근하여 넘겨주는 방식
- Seque prepare 메소드를 활용해서 데이터를 넘겨주는 방식
- Protocol / Delegate을 활용해서 데이터를 넘겨받는 방식
- Closure를 활용해서 데이터를 넘겨받는 방식
- NotificationCenter를 활용해 데이터를 넘기는 방식
2. A가 데이터를 다른 곳에 보관해두고 B가 나중에 필요할 때 꺼내가는 방식인 **<간접 전달 방식>**
- AppDelegate.swift 활용
- UserDefaults 사용
- CoreData or Realm 활용


### 직접 전달 방식
01. **프로퍼티를 이용한 데이터 전달 방식**  
**프로퍼티**란, 클래스/구조체/열거형에 연관되어있는 값(변수, 상수) 등을 프로퍼티라고 합니다. B 뷰컨에 프로퍼티를 만들어놓고, A 뷰컨에서 B 뷰컨에 대한 클래스 인스턴스를 생성하면 `(BVC인스턴스이름).프로퍼티명`과 같은 형태로 접근이 가능해집니다.  
다만 데이터를 전달되는 시점은 `vc.text = 넘기고자 하는 데이터`와 같은 코드가 실행되는 순간이 아니라, 현재 vc에서 데이터를 넘기려는 vc로의 push 혹은 present가 이루어지는 시점입니다.
    ~~~Swift
    @IBAction func first(_ sender: Any) {
            
        guard let vc =  storyboard?.instantiateViewController(identifier:       FirstViewController.identifier) as? FirstViewController else
        { return }
        
        vc.text = self.propertyTextField.text ?? ""
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    ~~~
02. **segue를 활용한 방식**  
segue는 **두 뷰 사이의 관계**를 의미하며, 스토리보드에서 간단하게 연결할 수 있습니다. segue는 출발점인 source와 destination 두 가지 요소로 이루어져있습니다. segue를 통한 화면 전환이 일어나기 전 `prepare(for: sender)` 메서드가 호출되는데, 이 메서드를 override 함에 따라 필요한 데이터 전달이 가능해집니다.  
    ~~~Swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondViewController {
            let vc = segue.destination as? SecondViewController
            vc?.text = self.segueTextField.text ?? ""
        }
    }
    ~~~
    segue의 목적지가 SecondViewController라면, segue의 destination 타입을 SecondViewController 타입으로 캐스팅하고 해당 목적지의 프로퍼티에 접근하여 값을 전달하는 코드입니다. 첫 번째 방식과 비교했을 때 전환 방식만 다를 뿐, 프로퍼티에 접근한다는 점은 동일합니다.

03. **delegation을 활용한 방식**  
delegate 패턴이란 "하나의 객체가 모든 일을 하는 것"이 아니라 **처리해야하는 일 중 일부를 다른 객체에게 위임하는 것**을 의미합니다.  
데이터를 받을 AVC와 데이터를 전달할 BVC가 있으면, 데이터를 받을 AVC는 프로토콜을 채택하고, 대리자로써 해당 기능을 수행하겠다고 선언(vc.delegate = self)하여 프로토콜의 기능에 대한 실제 구현을 합니다. 그러면 BVC에서 해당 프로토콜에 정의되어있는 함수가 실행될 때 AVC가 대신 구현한 구현부의 내용으로 함수가 동작하게 됩니다.  
또한 프로토콜 내에서 함수를 정의할 때, 함수 앞에 `optional` 키워드가 붙는지 아닌지에 따라 클래스/구조체/열거형의 객체들이 프로포콜을 채택했을 때 해당 함수를 반드시 구현해야하는지, 아닌지 여부가 달라집나다. 만약 `optional` 키워드가 붙었다면 함수를 구현해도 되고 구현하지 않아도 되지만, 만약 키워드가 붙지 않았다면 반드시 구현해주어야 합니다.

    | 데이터를 전달받는 뷰컨트롤러 | 데이터를 전달하는 뷰컨트롤러 |
    | ------| -----------|
    | 프로토콜 채택 | 타입이 프로토콜인 프로퍼티 생성 |
    | **대리자 위임** | 프로토콜 생성 |
    | 프로토콜 실제 구현    |  |

    예시) 
    ~~~Swift 
    // 데이터를 전달하는 프로토콜
    protocol MyProtocol { // 대리자에게 위임할 기능
    func protocolData(dataSent : String)
    }

    class ThirdViewController: UIViewController {
        static let identifier : String = ThirdViewController.classStaticName

        @IBOutlet weak var textField: UITextField!
        var delegate : MyProtocol? // 프로토콜 타입의 프로퍼티 선언
    
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        @IBAction func buttonClicked(_ sender: Any) {
            self.delegate?.protocolData(dataSent: self.textField.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }
    }
    ~~~
    ~~~Swift 
    // 데이터를 전달받는 프로토콜
        @IBAction func third(_ sender: Any) {
            
            guard let vc =  storyboard?.instantiateViewController(identifier:       ThirdViewController.identifier) as? ThirdViewController else
            { return }
            vc.delegate = self // ThiredViewController에 있는 MyProtocol 타입의 delegate가 바로 나(지금 있는 클래스)다!
        
            self.navigationController!.pushViewController(vc, animated: true)
        
        }

        func protocolData(dataSent: String) { //프로토콜의 실제 동작 정의
            self.delegationTextField.text = dataSent
        }
    ~~~


04. **클로저를 활용한 전달 방식**  
기본적으로 클로저는 다음과 같은 형태로 구성됩니다.
    ~~~Swift
    { (매개변수 목록) -> 반환타입 in
        실행코드
    }
    ~~~
    이러한 클로저는 변수, 상수에 할당할 수도 있으며, 함수의 파라미터로 전달될 수도 있는 일급 객체입니다.  
    클로저를 활용한 전달 방식은 다음과 같은 순서로 이루어집니다.  

    1. 데이터를 전달하고자 하는 뷰컨트롤러(이하 B 뷰컨)에서 클로저 타입의 프로퍼티를 선언합니다.
        ~~~Swift
        var completionHandler = ((String) -> (String))?
        ~~~
    2. B 뷰컨에서 클로저에 전달하고자 하는 값을 넣어둔 코드를 선언하면, completion 클로저가 call 됩니다. 
        ~~~Swift 
        // 실습 예제의 경우 버튼 클릭 이벤트 안에 선언
        completionHandler?(self.textField.text ?? "")
        ~~~
    3. 데이터를 전달받는 뷰컨트롤러(이하 A 뷰컨)에서 B 뷰컨 인스턴스를 생성 후, 해당 인스턴스에서 1번에서 선언한 클로저 타입의 변수에 접근해서 해당 클로저를 정의해줍니다. 그러면 B 뷰컨에서 넣어둔 값을 받아와서 활용할 수 있게 됩니다.
        ~~~Swift
        B뷰컨인스턴스.completionHandler = {
            text in
            self.closureTextLabel.text = text
            return text
        }

05. **NotificationCenter를 활용한 전달 방식**  
NotificaationCenter란 정보를 전달하기 위한 구조체입니다. NotificationCenter를 활용하기 위해서는 다음과 같은 두 가지 개념에 대해 익혀야합니다.
    
    ----
    1. NotificationCenter로 post하는 방법
    ~~~Swift
    NotificationCenter.default.post(name: NSNotification.Name("신호 이름"),
                                    object: "전달하고 싶은 데이터",
                                    userInfo: [KEY:VALUE])
    ~~~
    `name` : 전달하고자 하는 신호의 이름을 적습니다.  
    `object` : 전달하려고 하는 데이터를 넣습니다.  
    `userInfo` : 노티피케이션과 관련된 값 혹은 객체의 저장소를 넣습니다. 

    2. NotificationCenter에 observer를 등록하는 방법
    ~~~Swift
    NotificationCenter.default.addObserver(self, 
                                        selector: #selector(실행할 함수),
                                        name: Notification.Name("신호 이름"),
                                        object: nil)
    ~~~
    `self` : 현재 자기 자신의 뷰컨에 옵저버를 달겠다.  
    `selector` : 해당 신호를 받으면 실행하는 함수  
    `name` : 신호를 구분하기 위한 이름  
    `object` : 해당 신호를 걸러주는 필터같은 역할, nil 사용 시 해당 신호를 모두 받겠다는 의미
    
    ------
    이 개념을 데이터 전달 방식에 활용하면, 데이터를 전달하고자 하는 뷰컨을 NotificationCenter에 post하고, 데이터를 전달받는 뷰컨을 NotificationCenter의 Observer로 등록하여 "데이터 전달 신호"를 통해 object를 받아 해당 object를 활용할 수 있습니다.
    ~~~Swift
    // 데이터를 전달하고자 하는 뷰컨트롤러에서 NotificationCenter에 신호를 post합니다.
    NotificationCenter.default.post(name: NSNotification.Name("testNoti"), 
                                    object:  dataTextField.text!)
    ~~~
    ~~~Swift
    // 데이터를 전달받는 뷰컨트롤러를 NotificationCenter의 옵저버로 등록합니다.
    // testNoti 란 이름의 신호가 오면, dataReceived 함수가 실행됩니다.
    NotificationCenter.default.addObserver(self, 
                                selector: #selector(dataReceived), 
                                name: NSNotification.Name("testNoti"), 
                                object: nil)

    @objc func dataReceived(notification : NSNotification)
    {
        if let receivedText = notification.object as? String
        {
            notificationTextLabel.text = receivedText
        }
    }
    ~~~

### 간접 전달 방식

1. **UserDefaults를 활용한 전달 방식**  
UserDefaults란 Key-Value 형태로 값을 저장 / 쓰기가 가능한 클래스입니다. 기기에는 `.plist` 형태로 저장됩니다. 기기 안에 저장되어있는 파일이므로, 앱을 **앱을 종료하더라도 데이터가 보존**되어 있는 것이 특징입니다. 주로 자동 로그인 여부, 체크 여부 등 간단한 사용자 정보를 저장할 때 적합한 클래스입니다.
    ~~~Swift
    // userID를 Key로 "yeji" 라는 Value를 UserDefauls 클래스를 통해 저장하겠다.
    UserDefaults.standard.set("yeji", forKey: "userId")
    ~~~
    ~~~Swift
    // 저장된 데이터를 불러오는 방식, 키값을 통해 가져옴!
    let aUser:String = UserDafaults.standard.object(forKey: "UserId") as! String
    ~~~

2. **AppDelegate를 활용한 전달 방식**  
AppDelegate.swift 파일에 변수를 선언한 후, 뷰컨트롤러에서 접근하는 방식
    ~~~Swift
    let ad = UIApplication.shared.delegate as? AppDelegate
    ~~~
    뷰컨에서 위와 같이 선언하면, ad 변수를 통해 AppDelegate에 있는 변수에 접근이 가능하게 됩니다.
