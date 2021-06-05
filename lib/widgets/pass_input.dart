import 'package:flutter/material.dart';
import 'package:medom/widgets/textfield_container.dart';

import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Function onClick;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onSaved: onClick,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ' votre mot de passe svp ';
          }else{
            return null;
          }

        },
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
