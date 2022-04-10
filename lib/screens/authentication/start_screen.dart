import 'package:flutter/material.dart';
import 'package:talent_bank/constants.dart';
import 'package:talent_bank/screens/authentication/login_screen.dart';
import 'package:talent_bank/screens/authentication/register_page.dart';
import 'package:talent_bank/size_config.dart';

class StartScreen extends StatelessWidget {
  static String routeName = '/start';
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig();
    size.init(context);
    return Scaffold(
      body: Stack(
        children: [
          // # 시작 화면에 배경 디자인이 될 사진
          // Container(
          //   child: Image.asset(
          //     'assets/images/images2.png',
          //     fit: BoxFit.fill,
          //   ),
          //   width: size.width,
          //   height: size.height,
          // ),
          // # 로그인, 회원가입 버튼
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.16),
                  child: Icon(
                    Icons.circle,
                    size: 250,
                  ),
                  // child: CircleAvatar(
                  //   backgroundImage:
                  //       AssetImage('assets/images/image_1_big.png'),
                  //   backgroundColor: Colors.white,
                  //   radius: size.width * 0.25,
                  // ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.15),
                  child: Column(
                    children: [
                      StartPageButton(
                        text: '로그인',
                        route: LoginScreen.routeName,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      StartPageButton(
                        text: '회원가입',
                        route: RegisterScreen.routeName,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StartPageButton extends StatelessWidget {
  final String text;
  final String route;
  const StartPageButton({Key? key, required this.text, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight * 0.08,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.18,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
            primary: kYellowColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))),
      ),
    );
  }
}
