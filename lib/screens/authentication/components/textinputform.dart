import 'package:flutter/material.dart';
import 'package:talent_bank/size_config.dart';

class TextInputForm extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final String? Function(String?) validate;
  final void Function(String?) onsave;

  const TextInputForm({
    Key? key,
    required this.label,
    required this.obscure,
    required this.validate,
    required this.onsave,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validate,
      onSaved: onsave,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey)),
        label: Container(
          height: SizeConfig.screenHeight * 0.07,
          child: Text('$label'),
        ),
        hintText: hint,
        contentPadding: EdgeInsets.only(left: 5),
      ),
      obscureText: obscure,
    );
  }
}
