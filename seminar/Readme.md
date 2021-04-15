
## H.I.G (Human Interface Graphic)
일관된 사용자 경험을 제공하기 위해 필요한 디자인과 동작을 포함한 여러 규칙들
* **핵심 가치**
	 1. **Clarity**  
		 가독성 높은 텍스트,  이해하기 쉬운 아이콘, 최소화된 장식, 기능 주도의 디자인
	 2. **Deference**  
			 전체 화면을 활용한 컨텐츠 표시,  베젤, 그라데이션 및 그림자를 최소한으로 사용하여 인터페이스를 밝게 유지
	 3. **Depth**  
	   레이어와 모션을 활용하여 계층 구조 표현, 컨텐츠를 이동할 때 깊이감을 주도록 화면 전환
* **디자인 6원칙**
	1. **Aesthetic Integrity** (심미적 통일)
		앱의 모양, 동작이 기능과 얼마나 잘 통합되어있는지 나타냄
	2. **Consistency** (일관성)
		아이콘, 표준 텍스트 스타일, 통일된 용어등을 사용한 익숙한 표준 및 패러다임 구현
	3. **Direct Manipulation** (직접 조작)
		장치 회전, 제스처 사용등과 같은 직접 컨텐츠 조작을 통해 사용자의 이해도 높이기
	4. **Feedback** (피드백)
		사용자가 발생시킨 동작에 대해 그래픽, 사운드를 통한 작업결과 보여줌
	5. **Metaphors** (비유)
		사용자들이 친숙하게 느낄만한 비유를 통해 이해를 돕는다.
	6. **Use Control** (사용자 컨트롤)
		중요한 작업은 사용자가 직접 결정하여 동작하도록 한다.
	
* **HIG 구성 요소**
	- Label - 짧은 메세지를 담는 UI 요소
	- Button - 앱에서 눌렀을 때 동작을 시작하고, 특정 기능을 수행하는 UI 요소
		- 지정 버튼 스타일
			1. System Buttons : 어디서든 사용 할 수 있는 형태의 기본 버튼 
			2. Detail Disclosure Button : 해당 행의 세부정보를 보여주기 위해 사용
			3. Info Button : 앱의 상세 설정창 표시
			4. Add Contact Button : 메세지 작성 혹은 연락처 리스트 탐색시 텍스트 필드 혹은 다른 뷰 삽입시 사용, 정보를 입력하기 위한 유일한 수단이 되어선 안됨
	- Text Field - 사용자로부터 적은 양의 정보를 받을 수 있는 요소, clear 버튼 사용 권장 (Appears while editing)


## 화면 전환
**모달(Modal)** 혹은 **네비게이션(Navigation)** 방식 활용
1. **모달(Modal)**
새로운 창이 기존 창 위에 뜨는 방식
	* **Seque를 통한 화면 전환**  
![image](https://user-images.githubusercontent.com/69361613/113988485-7d4c6700-988a-11eb-972a-f82fb93448ec.png)
	* **코드를 통한 화면 전환**  
		1. 전환하려는 뷰와 연결할 ViewController 생성
		2. Custom Class 의 Class 이름과 identifier를 생성한 ViewController의 이름과 동일하게 설정
		3. ViewController와 전환에 사용할 버튼 연결
		4. 모달 띄우기
		~~~swift
		guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") 
		as? SecondViewController else { return }
		self.present(nextVC, animated: true, completion: nil)
		~~~
		5. 뒤로가기 동작
		~~~ swift
		self.dismiss(animated: true, completion: nil)
		~~~
 2. **네비게이션(Navigation)**  
 깊이와 흐름을 나타내기 위해 사용하는 구조, modal 뷰와 달리 자식뷰를 Navigation Stack에 쌓고 관리  
	 * present가 아닌 push를 통해 뷰를 navigation stack에 쌓아감  
	 ~~~swift
	 self.navigationController?.pushViewController(nextVC, animated: true)
	 ~~~
	 * dismiss가 아닌 popViewController 메서드를 통해 navigation stack에서 viewController를 pop함  
	 ~~~swift
	 self.navigationController?.popViewController(animated: true)
	~~~
	

## 데이터 전달 기초
* 인스턴스의 **프로퍼티**에 접근해 데이터 넘기기  
		-> 뷰컨트롤러 인스턴스를 생성하면, 생성된 뷰컨트롤러 인스턴스의 프로퍼티에 접근이 가능해짐
		
~~~swift
// SecondViewController.swift -> 데이터를 전달받는 컨트롤러
	class secondViewController: UIViewController {
		...
			@IBOutlet  weak  var messageLabel: UILabel!
			var message : String? // SecondViewController 인스턴스를 통해 접근 가능

			override func viewDidLoad() {
				super.viewDidLoad()
				setLabel()
			}

			func setLabel() {
				if let msg = self.message {
					messageLabel.text = msg
				}
			}
		...
	}
~~~
~~~swift
// firstViewController.swift -> 데이터를 전달하는 컨트롤러
...
	guard let nextVC = self.storyboard?.instantiateViewController(identifier:"secondViewController") as? secondViewController else { return }

	nextVC.message = messageTextField.text 
...
~~~

+)
## ViewController Life Cycle
![image](https://user-images.githubusercontent.com/69361613/113997206-e1732900-9892-11eb-8949-1131b405a15d.png)

* viewDidLoad - 뷰 계층이 최초 메모리에 로드 된 후 호출되는 메서드,  메모리에 처음 로딩 될 때 1회만 호출 
* viewWillAppear - 뷰가 계층에 추가되고 화면이 표시되기 직전에 호출되는 메서드
* viewDidAppear - 뷰가 계층에 추가되어 화면이 표시되면 호출되는 메서드
* viewWillDisappear - 뷰가 계층에서 사라지기 직전에 호출되는 메서드
* viewDidDisappear - 뷰가 계층에서 사라진 후 호출되는 메서드
