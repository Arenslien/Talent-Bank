import 'package:flutter/material.dart';
import 'package:talent_bank/constants.dart';
import 'package:talent_bank/size_config.dart';

class EventButton extends StatelessWidget {
  final void Function()? onpress;
  const EventButton({Key? key, required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight * 0.07,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
      child: ElevatedButton(
        onPressed: onpress,
        child: Text(
          '찾기',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        style: ElevatedButton.styleFrom(
            primary: kYellowColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))),
      ),
    );
  }
}
