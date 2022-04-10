import 'package:flutter/material.dart';
import 'package:talent_bank/constants.dart';
import 'package:talent_bank/size_config.dart';

class Button extends StatelessWidget {
  final Function() func;
  const Button(
      {Key? key, required GlobalKey<FormState> formKey, required this.func})
      : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight * 0.07,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate() == true) {
            //입력 폼에 입력한 정보 값이 일치하는 경우
            _formKey.currentState!.save();
            func;
          }
        },
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
