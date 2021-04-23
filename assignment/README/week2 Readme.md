

![아이폰se](https://user-images.githubusercontent.com/69361613/115853799-85003400-a464-11eb-86e1-95e6eae43f42.gif)
![아이폰8](https://user-images.githubusercontent.com/69361613/115853818-89c4e800-a464-11eb-99d0-8ff4af75eece.gif)
![아이폰12](https://user-images.githubusercontent.com/69361613/115853823-8af61500-a464-11eb-8ead-2d2f31fb8c42.gif)  
아이폰se, 아이폰8, 아이폰12


왕초보에게 이번 과제는 참 많은 노력이 필요했는데... 그만큼 얻어가는 것도 많았어요!

## 현재 스토리보드에서 다른 스토리보드로 전환
한 스토리보드 안에 여러 개의 뷰컨트롤러를 넣을 경우 충돌이 일어나기 쉽다는 세미나의 내용을 듣고 이번 주차에서는 프로젝트에서 폴더를 나누고, 뷰컨트롤러별로 스토리보드를 생성하고 구조를 나눠보았습니다.
그런데 로그인 버튼을 누르고 기존에 배웠던 방식으로 화면 전환을 하려니까 다음과 같은 에러가 뜨더라구요..

![image](https://user-images.githubusercontent.com/69361613/114855106-87d5a600-9e20-11eb-9e7b-257f64938aed.png)

~~~swift 
// 기존 세미나에서 배웠던 방식, 동일한 스토리보드 내에서 화면 전환
  guard let nextVC = self.storyboard?.instantiateViewController(identifier: "FriendTabViewController") as? FriendTabViewController else {
            return
        }
~~~

분명히 전환하고자 하는 스토리보드 뷰컨트롤러를 제대로 연결도 했는데 되지 않아서, 왜 이럴까 고민해보다가 self.storyboard가 의심스러워졌습니다. self.sotryboard?를 하면 해당 코드를 작성한 viewController와 연결된 스토리보드 안에서 FriendTabViewController를 찾게 될 것이고, 따라서 다른 스토리보드에 존재하는 FriendTabViewController를 identifier로 가지는 뷰컨트롤러를 찾을 수 없을 것 같다는 생각이 들어 다음과 같이 코드를 고쳐보았습니다.

~~~swift
let TabStoryboard = UIStoryboard(name: "FriendTab", bundle: nil)
let nextVC = TabStoryboard.instantiateViewController(identifier: "FriendTabViewController")
~~~

성공! 무아요 ~!


## 도전과제.. 나도 할 수 있겠지..? 👀
풀스크린 모달을 손가락(마우스 포인터)으로 swipe down이 가능하도록 하는 것이 도전 과제로 주어졌습니다. 저는 왕초보니까.. 도전 과제를 위해 필요한 개념들에 대한 이해가 필요했고, 몇 가지를 정리해보았습니다.

### **overFullScreen vs fullScreen**  
겉으로 보이기에는 같아보이지만 차이점이 있습니다. .fullScreen으로 modalPresentationStyle을 지정할 경우 현재 뷰컨트롤러의 뷰들이 계층에서 사라지게 되는 반면, .overFullScreen의 경우 현재 뷰컨트롤러의 뷰들이 계층에서 사라지지 않고 남아있습니다. 따라서 배경을 투명하게 할 경우, 백그라운드에 이전 화면의 모습이 보이게 됩니다. 따라서 도전 과제에서는 fullScreen이 아닌 overFullScreen을 사용해야 하겠죠!

### **PanGestureRecognizer**  
~~~Swift
class UIPanGestureRecognizer : UIGestureRecognizer
~~~
사실 저는 PanGestureRecognizer라는 걸 처음 봤는데요.. 그래서 [애플의 공식문서](https://developer.apple.com/documentation/uikit/uipangesturerecognizer)를 찾아보았습니다.  
> A discrete gesture recognizer that interprets panning gestures.  UIPanGestureRecognizer is a concrete subclass of UIGestureRecognizer. Clients of this class can, in their action methods, query the UIPanGestureRecognizer object for the current translation of the gesture (translation(in:)) and the velocity of the translation (velocity(in:)). They can specify a view’s coordinate system to use for the translation and velocity values. Clients can also reset the translation to a desired value.  

대충 알아들으셨죠..? ^^ 포인터가 움직이는 제스처를 인식하는 데에 사용되는 클래스 인 것 같아요..?
panning 이라는 단어가 좀 생소하게 느껴져서 찾아보니, **'카메라를 삼각대 위에 고정시켜 놓은 상태에서 움직이는 피사체를 따라 카메라를 수평으로 회전시키는 일’로 디바이스는 고정되어 있는 상태에서 손가락이 움직이기 때문에 Pan이라는 단어를 사용한다.** 라고 합니다. 

### **translation**

~~~Swift
func translation(in view: UIView?) -> CGPoint
~~~ 
[애플의 공식문서](https://developer.apple.com/documentation/uikit/uipangesturerecognizer/1621207-translation)에 따르면, 
특정한 뷰의 좌표계에 있는 팬 제스처를 해석하는 메서드라고 합니다. 간단히 말해, 파라미터로 받은 UIView의 이동 위치를 저장하는 메서드라고 생각하면 됩니다.  
translation 메서드는 CGPoint라는 타입을 반환값으로 가지고 있는데, 이게 무엇인고.. 하면, **2차원 좌표계의 점을 포함하는 구조체** 인데요!
[2주차 세미나 보충자료](https://www.notion.so/2-73c27e6d6bba42ee92aec7c87ffd8b52)를 보면 더 자세히 알 수 있어요 ^_^ 아무튼, UIView가 이동한 위치를 반환해주는 메서드이므로 CGPoint로 값을 반환하는 건 당연하겠네요!


### **addGestureRecognizer**
~~~Swift
func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer)
~~~
뷰에 제스처를 연결하는 메서드입니다. 제스처에 따라 어떤 동작을 할 지를 정의하는 메서드를 만든다고 해서 뷰가 자동으로 그 메서드에 맞춰 동작하는게 아니라, 내가 정의한 제스처 동작을 해당 뷰에 연결해줘야 그 뷰가 해당 동작을 할 수 있겠죠? 

### **그럼 일단 한번 해보자 !**
~~~Swift
@objc func panGestureDismiss(_ sender: UIPanGestureRecognizer) {
      let touchPoint = sender.translation(in: view)
      let initialTouchPoint = CGPoint(x: 0, y: 0)
        
      switch sender.state {
      case .changed: // translation한 만큼 뷰를 이동시킴
          if touchPoint.y - initialTouchPoint.y > 0 {
              view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: view.frame.width, height: view.frame.height)
          }
      case .ended: // 얼마나 이동했느냐에 따라 dimiss 혹은 초기 상태로 변경
          touchPoint.y - initialTouchPoint.y > 200 ? dismiss(animated: true, completion: nil) : UIView.animate(withDuration: 0.3) { self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height) }
      default:
          break
      }
  }
~~~
구선생님의 힘을 빌렸지만.. 이해하고 내껄로 만들면 되니까요 ^^;;...  
일단 우리는 팬제스처가 어떤 동작을 할 지를 정의하는 메서드를 만들었습니다. touchPoint는 현재 뷰의 위치를 나타내는 값입니다.  
그 다음, UIPanGestureRecognizer의 상태(state)에 주목해보면, 팬제스처의 상태가 변화(changed)할 때와 끝날 때(ended)를 인식해서 각각의 상태에서 어떤 동작을 할 지를 정의해줍니다.  
먼저 상태가 변화하고 있을 때(포인터를 계속 뷰 위에 올리고 있을 때)를 봅시다. 포인터가 움직일 때마다 움직인 위치로 뷰를 이동시키기 위해서 해당 동작을 정의해주어야 합니다. y좌표는 우리가 통상적으로 알고있는 것처럼 세로 좌표를 나타내므로, up and down을 판별하는데에 사용할 수 있답니다! 따라서 현재 포인터의 위치가 0보다 크면, **초기 위치에 비해 포인터를 아래로 이동시켰다**는 걸 의미하게 되니까, 해당 좌표로 뷰를 이동시킵니다. 
뭔 소린지 잘 이해가 안되면 움짤로 확인해보세요 !  
![changed_none](https://user-images.githubusercontent.com/69361613/115771125-85f38000-a3e8-11eb-83a4-0524dd037578.gif)
![changed_ok](https://user-images.githubusercontent.com/69361613/115771146-8a1f9d80-a3e8-11eb-8dbd-15fec585b9e1.gif)  
첫번째 사진은 changed 동작을 정의하지 않았을 때고, 두번째 사진은 changed 동작을 정의했을 때입니다. ended 동작을 제대로 해주었기 때문에 결과적으로는 정상적으로 내려가긴 하지만, 사용자 입장에선 띠용스럽겠죠^^;;

아무튼 이렇게 포인터를 이동시킬 때의 동작을 정의해주었다면, 최종적인 동작에 대한 정의가 필요하겠죠? 그러기 위해서는 ended(포인터를 뷰에서 뗐을 때) 상태에서의 동작을 정의해주어야 합니다. 포인터를 조금만 내렸을 때(여기서는 기준을 200만큼 으로 잡았어요.)는 다시 원래의 위치로 돌아가도록 하고, 정해진 기준 이상으로 포인터를 다운시켰을 때는 아예 모달이 dismiss 되도록 합니다.   
CGRect 값을 넣어주는 이유는 frame이 CGRect 타입이기 때문입니다. CGRect은 **사각형을 표현하기 위한 구조체**인데, 뷰의 모양이 사각형이니까 CGRect인 것 같네요! changed의 경우 변경될 때마다 y축의 값이 변경되어서 뷰가 올라갔다가 내려갔다가할 수 있게 된거고, ended 상태에서 뷰를 조금만 내렸을 때는 다시 y축 좌표를 0으로 이동시켜서 맨 위로 이동하게 된 겁니다! 뷰의 width와 height는 변경할 필요가 없으니 그대로 둔 것이구요. (심심하신 분은 숫자를 막 넣어보시길..^^ 엄청난 일이 일어나더라구여..)

근데 여기서 끝이 아니고, 이렇게 제스처의 동작을 정의해주었다면 이렇게 정의한 동작을 뷰와 연결해주어야 합니다. 위에서 addGestureRecognizer 배웠죠?
~~~Swift
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureDismiss(_:)))
    view.addGestureRecognizer(panGesture)
~~~
요렇게 말입니다. UIPanGestureRecognizer의 타겟, 액션을 정의해준 후 이를 뷰에 연결합니다. action에는 우리가 만들었던 panGestureDismiss 함수를 지정해줍니다.

이렇게 연결까지 해주면? 정상적으로 동작한답니다..... 좀 눈물나네여? 리드미 쓰면서 완벽은 아니지만 거의 이해했읍니다..  
왕초보도 할 수 있다 ~~~~~ 😭 
