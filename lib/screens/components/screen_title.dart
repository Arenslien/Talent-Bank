import 'package:flutter/material.dart';
import 'package:talent_bank/size_config.dart';

class ScreenTitle extends StatefulWidget {
  late Widget child;
  final String title;
  final double adjust;

  ScreenTitle(
      {Key? key,
      required this.child,
      required this.title,
      required this.adjust})
      : super(key: key);

  @override
  State<ScreenTitle> createState() => _ScreenTitleState();
}

class _ScreenTitleState extends State<ScreenTitle> {
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
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.03),
              padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: SizeConfig.screenWidth * widget.adjust),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.grey))),
              child: Text(
                widget.title,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            leadingWidth: SizeConfig.screenWidth * 0.08,
            leading: Container(
              margin: EdgeInsets.only(left: 5, top: 2),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                  )),
            ),
            backgroundColor: Colors.transparent, // 앱바 투명색으로 설정
            elevation: 0.0,
          ),
          // extendBodyBehindAppBar: true, // 앱바를 body 위에
          body: widget.child),
    );
  }
}
