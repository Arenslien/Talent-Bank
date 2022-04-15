import 'package:flutter/material.dart';
import 'package:talent_bank/size_config.dart';
import 'package:talent_bank/constants.dart';
import 'package:talent_bank/screens/components/event_button.dart';
import 'package:talent_bank/screens/components/show_dialog.dart';
import 'package:talent_bank/screens/components/textinputform.dart';

class FindPasswordScreen extends StatefulWidget {
  static String routeName = 'findPassword/';
  const FindPasswordScreen({Key? key}) : super(key: key);

  @override
  State<FindPasswordScreen> createState() => _FindPasswordScreenState();
}

class _FindPasswordScreenState extends State<FindPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool certification = false;

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
              '                 비밀번호 찾기                      ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
              margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.1),
              width: SizeConfig.screenWidth * 0.78,
              // height: SizeConfig.screenHeight * 0.85,
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
                            vertical: SizeConfig.screenHeight * 0.08),
                        child: Column(
                          children: [
                            TextInputForm(
                              label: '성명',
                              hint: '성명을 입력하세요',
                              enable: true,
                              obscure: false,
                              validate: (value) {
                                if (certification == false) {
                                  if (value!.isNotEmpty) {
                                    //!!아이디 입력 조건이 있으면 ~하라는 함수를 추가
                                    return null;
                                  } else {
                                    return '성명을 입력해주세요';
                                  }
                                } else {
                                  return null;
                                }
                              },
                              onsave: (value) {
                                //value를 데이터베이스에 저장하는 함수
                              },
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.06,
                            ),
                            TextInputForm(
                              label: '이메일',
                              hint: '이메일을 입력하세요',
                              enable: true,
                              obscure: false,
                              validate: (value) {
                                if (certification == false) {
                                  if (value!.isNotEmpty) {
                                    //!!비밀번호 입력 조건이 있으면 ~하라는 함수를 추가
                                    if (value!.contains('@')) {
                                      return null;
                                    } else {
                                      return '이메일에 @를 포함시켜주세요';
                                    }
                                  } else {
                                    return '이메일을 입력해주세요';
                                  }
                                } else {
                                  return null;
                                }
                              },
                              onsave: (value) {
                                //value를 데이터베이스에 저장하는 함수
                              },
                            ),
                            // SizedBox(
                            //   height: 0,
                            // ),
                          ],
                        ),
                      ),
                      EventButton(
                          label: '사용자 인증',
                          onpress: () {
                            if (_formKey.currentState!.validate() == true) {
                              //입력 폼에 입력한 정보 값이 일치하는 경우
                              _formKey.currentState!.save();
                              FlutterDialog(context, '인증완료', '인증완료');
                              setState(() {
                                certification = true;
                              });
                              // if(데이터 불러오기 성공){

                              //}
                              // else if() { 일치하는 데이터가 없는 경우
                              //
                              // }
                              // else{ 데이터 불러오기에 실패한 경우
                              //
                              // }
                            }
                          }),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight * 0.08),
                        child: Column(
                          children: [
                            TextInputForm(
                              label: '비밀번호',
                              hint: '재설정할 비밀번호를 입력하세요',
                              enable: certification,
                              obscure: true,
                              validate: (value) {
                                if (certification == true) {
                                  if (value!.isNotEmpty) {
                                    //!!아이디 입력 조건이 있으면 ~하라는 함수를 추가
                                    return null;
                                  } else {
                                    return '재설정할 비밀번호를 입력해주세요';
                                  }
                                } else {
                                  return null;
                                }
                              },
                              onsave: (value) {
                                //value를 데이터베이스에 저장하는 함수
                              },
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.06,
                            ),
                            TextInputForm(
                              label: '비밀번호 확인',
                              hint: '재설정할 비밀번호 한번 더 입력하세요',
                              enable: certification,
                              obscure: true,
                              validate: (value) {
                                if (certification == true) {
                                  if (value!.isNotEmpty) {
                                    //!!비밀번호 입력 조건이 있으면 ~하라는 함수를 추가
                                    return null;
                                  } else {
                                    return '재설정할 비밀번호를 한번 더 입력해주세요';
                                  }
                                } else {
                                  return null;
                                }
                              },
                              onsave: (value) {
                                //value를 데이터베이스에 저장하는 함수
                              },
                            ),
                            // SizedBox(
                            //   height: 0,
                            // ),
                          ],
                        ),
                      ),
                      EventButton(
                          label: '비밀번호 재설정',
                          onpress: certification
                              ? () {
                                  if (_formKey.currentState!.validate() ==
                                      true) {
                                    //입력 폼에 입력한 정보 값이 일치하는 경우
                                    _formKey.currentState!.save();
                                    FlutterDialog(context, 'abcd', '귀하의 비밀번호');
                                  }
                                }
                              : null),
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
