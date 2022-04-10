import 'package:flutter/material.dart';
import 'package:talent_bank/constants.dart';

FlutterDialog(BuildContext context, String id, String text) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$text'),
          content: Text('$text : $id'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '확인',
                // style: TextStyle(

                // ),
              ),
              // style: ElevatedButton.styleFrom(

              // ),
            )
          ],
        );
      });
}
