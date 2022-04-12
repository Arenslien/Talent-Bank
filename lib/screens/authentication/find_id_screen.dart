import 'package:flutter/material.dart';
import 'package:talent_bank/constants.dart';
import 'package:talent_bank/screens/components/event_button.dart';
import 'package:talent_bank/screens/components//textinputform.dart';
import 'package:talent_bank/size_config.dart';
import 'package:talent_bank/screens/components//show_dialog.dart';

class FindIdScreen extends StatefulWidget {
  static String routeName = '/findId';
  const FindIdScreen({Key? key}) : super(key: key);

  @override
  State<FindIdScreen> createState() => _FindIdScreenState();
}

class _FindIdScreenState extends State<FindIdScreen> {
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
              '                  아이디 찾기                      ',
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
                            vertical: SizeConfig.screenHeight * 0.16),
                        child: Column(
                          children: [
                            TextInputForm(
                              label: '성명',
                              hint: '성명을 입력하세요',
                              obscure: false,
                              enable: true,
                              validate: (value) {
                                if (value!.isNotEmpty) {
                                  //!!아이디 입력 조건이 있으면 ~하라는 함수를 추가
                                  return null;
                                } else {
                                  return '성명을 입력해주세요';
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
                              label: '이메일',
                              hint: '이메일을 입력하세요',
                              obscure: true,
                              enable: true,
                              validate: (value) {
                                if (value!.isNotEmpty) {
                                  //!!비밀번호 입력 조건이 있으면 ~하라는 함수를 추가
                                  return null;
                                } else {
                                  return '이메일을 입력해주세요';
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
                          label: '찾기',
                          onpress: () {
                            if (_formKey.currentState!.validate() == true) {
                              //입력 폼에 입력한 정보 값이 일치하는 경우
                              _formKey.currentState!.save();
                              // if(데이터 불러오기 성공){
                              FlutterDialog(context, 'abc', '귀하의 아이디');
                              //}
                              // else if() { 일치하는 데이터가 없는 경우
                              //
                              // }
                              // else{ 데이터 불러오기에 실패한 경우
                              //
                              // }
                            }
                          })
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
