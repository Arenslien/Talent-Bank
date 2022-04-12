import 'package:flutter/material.dart';
import 'package:talent_bank/constants.dart';
import 'package:talent_bank/size_config.dart';

class EventButton extends StatelessWidget {
  final void Function()? onpress;
  final String label;
  const EventButton({Key? key, required this.onpress, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight * 0.07,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
      child: ElevatedButton(
        onPressed: onpress,
        child: Text(
          '$label',
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
