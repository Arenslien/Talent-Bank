import 'package:flutter/material.dart';
import 'package:talent_bank/constants.dart';
import 'package:talent_bank/screens/home/home_screen.dart';
import 'package:talent_bank/screens/authentication/find_id_screen.dart';
import 'package:talent_bank/size_config.dart';
import 'package:talent_bank/screens/authentication/components/textinputform.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Scaffold 터치 시 포커스 해제(키보드 입력 중 바탕 클릭 시 키보드 내려감)
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            //페이지 제목
            padding: EdgeInsets.only(top: 7, bottom: 4),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1.5, color: Colors.grey))),
            child: Text(
              '                    로그인                        ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent, // 앱바 투명색으로 설정
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true, // 앱바를 body 위에
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              // 입력 폼이 존재하는 박스
              margin: EdgeInsets.only(top: 85),
              width: SizeConfig.screenWidth * 0.78,
              height: SizeConfig.screenHeight * 0.85,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     width: 2.0,
              //     color: Colors.black,
              //   ),
              // ),
              child: Form(
                // 입력 폼
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight * 0.16),
                        child: Column(
                          children: [
                            TextInputForm(
                              label: '아이디',
                              hint: '아이디를 입력하세요',
                              obscure: false,
                              validate: (value) {
                                if (value!.isNotEmpty) {
                                  //!!아이디 입력 조건이 있으면 ~하라는 함수를 추가
                                  return null;
                                } else {
                                  return '아이디를 입력해주세요';
                                }
                              },
                              onsave: (value) {
                                //value를 데이터베이스에 저장하는 함수
                              },
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.1,
                            ),
                            TextInputForm(
                              label: '비밀번호',
                              hint: '아이디를 입력하세요',
                              obscure: true,
                              validate: (value) {
                                if (value!.isNotEmpty) {
                                  //!!비밀번호 입력 조건이 있으면 ~하라는 함수를 추가
                                  return null;
                                } else {
                                  return '비밀번호를 입력해주세요';
                                }
                              },
                              onsave: (value) {
                                //value를 데이터베이스에 저장하는 함수
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              //아이디, 비밀번호 찾기 텍스트
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FindText(
                                  label: '아이디 찾기',
                                  route: FindIdScreen.routeName,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FindText(
                                    label: '비밀번호 찾기',
                                    route: FindIdScreen.routeName)
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: SizeConfig.screenHeight * 0.08,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.04),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() == true) {
                              //입력 폼에 입력한 정보 값이 일치하는 경우
                              _formKey.currentState!.save();
                              Navigator.pushNamed(
                                  context, HomeScreen.routeName);
                            }
                          },
                          child: Text(
                            '로그인',
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: kYellowColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 아이디, 비밀번호 찾기 텍스트 커스텀 위젯
class FindText extends StatelessWidget {
  final String label;
  final String route;

  const FindText({Key? key, required this.label, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}
