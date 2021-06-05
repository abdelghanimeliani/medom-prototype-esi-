import 'package:flutter/material.dart';
import 'package:medom/widgets/textfield_container.dart';

import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  final Function onClick;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
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
            return "taper votre nom d'utilisateur";
          }else{
            return null;
          }

        },
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
