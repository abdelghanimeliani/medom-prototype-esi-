

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medom/screens/med/home/home_med.dart';
import 'package:medom/screens/user/home/home_user.dart';
//import 'package:medom/services/auth.dart';
//import 'package:medom/services/auth.dart';
import 'package:medom/widgets/button.dart';
import 'package:medom/widgets/input.dart';
import 'package:medom/widgets/pass_input.dart';

import 'body.dart';

import '../../../constants.dart';
import 'back.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

  var auth = FirebaseAuth.instance ;
    return Form(
        key: _formKey,
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: kPrimaryColor),
                ),
                SizedBox(height: size.height * 0.03),
                Image.asset(
                  "assets/images/doctor.png",
                  width: size.width * 0.35,
                ),
                SizedBox(height: size.height * 0.1),
                RoundedInputField(
                  hintText: "Your Email",

                  onClick: (value) {
                    BodyLogin.email = value ;
                  },
                ),
                RoundedPasswordField(

                  onClick: (value) {
                    BodyLogin.password = value;
                  },
                ),
                RoundedButton(
                    text: "LOGIN",
                    press: () async {

                      if (_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        print("---------------------------");
                        print(BodyLogin.email);
                        print("----------------------");
                        print(BodyLogin.password);
                        print("---------------------------------");


                        try {
                          UserCredential userCredential = await auth.signInWithEmailAndPassword(
                              email: BodyLogin.email,
                              password: BodyLogin.password
                          );

                          if(BodyLogin.email.contains("medom")){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                          }else{
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageMalade()));
                          }

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      }

                    }

                    ),
              ],
            ),
          ),
        ));
  }
}
