import 'package:flutter/material.dart';

import 'custom_form.dart';

import 'back.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key key,
  }) : super(key: key);
  static String password, email;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyCustomForm();
  }
}
