import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

class LoginScreen extends StatelessWidget {
  static var id = "sigg in page";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: BodyLogin()),
    );
  }
}
