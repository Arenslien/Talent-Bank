# Team Cornerstone - 4딸란트 Project
---
## 🚨중요사항🚨

## 개발 전 업데이트된 코드 가져오기
+ git branch -M <자신이 사용할 브랜치 명>
+ git checkout <자신이 사용할 브랜치 명>
+ git pull origin main

## 새로 작성한 코드 원격 저장소에 업데이트 하기
+ git add *
+ git commit -m "변경사항과 관련된 메시지"
+ git push origin <자신이 사용하는 브랜치 명>
---
## 🚨디렉토리 구조🚨
+ components -> 리팩토링한 위젯을 관리하는 폴더
  + authenticate
  + bank_management
  + public
  + student_management
  + talent_management
+ screens -> 각 스크린을 관리하는 폴더
  + authenticate -> 민석
  + bank_management -> 성훈
  + student_management -> 성훈
  + talent_management -> 민석
+ constants.dart -> 각종 상수를 관리
+ main.dart
+ routes.dart -> 라우트 관리
+ theme.dart -> MaterialApp ThemeData 관리
---
## 🚨개발할 때 고려할 사항🚨
+ 스크린을 새로 만들 때 static String routeName = '/사용할라우트이름';을 추가 후 routes.dart파일에 추가해주세요 // 인자 값 전달해야 할 경우 사용 X 
+ 스크린 이동은 Navigator.pushName() 함수를 사용해주세요
+ component 폴더는 리팩토링한 위젯을 관리하는 폴더입니다
+ 그 중 public 폴더는 전체적으로 사용되는 공용 위젯 폴더입니다

