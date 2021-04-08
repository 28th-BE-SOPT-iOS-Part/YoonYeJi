![week1 과제동작](https://user-images.githubusercontent.com/69361613/114004015-374acf80-9899-11eb-8b0b-06d87f3f2fc3.gif)


* **요구사항**  

|내용|비고|
|--|--|
|로그인 뷰 | ✅ |
|회원가입 뷰 | ✅|
|확인 뷰|✅|
|로그인 -> 회원가입 전환 (push)|✅|
|회원가입 -> 확인 전환 (present)|✅|
|로그인 -> 확인 전환 (present)|✅|
|확인 -> 로그인|✅|
|모든 TextField에 clear 버튼|✅|
|TextField에 placeholder|✅|
|빈 TextField 존재 시 화면 전환 ❌(로그인/회원가입)|✅|
|비밀번호 TextField에 Secure Text Entry 옵션|✅|

* **확인버튼 클릭 시 Login 화면으로 돌아가기**
~~~swift
// SignUpViewController.swift
self.present(nextVC, animated: true, completion: { self.navigationController?.popViewController(animated: true) })
~~~
  
completion에는 어떠한 작업(여기서는 modal present)이 끝났을 때 수행할 동작 블럭을 파라미터로 넣는다.
SignUpViewController에서 확인 모달을 띄운 후 navigation stack에서 SignUpViewController를 pop하여서 확인 버튼 클릭 시 로그인 화면으로 돌아가도록 할 수 있다.
