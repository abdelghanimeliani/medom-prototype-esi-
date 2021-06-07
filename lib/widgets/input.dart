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
           if (hintText.contains('email')){
             return 'taper ton adresse e-mail svp' ;
           }else if (hintText.contains('places')){
             return 'taper le nombre de places libres actuelement';
           }else if (hintText.contains('med')){
             return 'ajouter le nombre de medecins';
           }
          }else return null ;

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
