

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medom/screens/med/home/home_med.dart';
import 'package:medom/screens/medical_interface/DoctorPage.dart';

import 'package:medom/screens/root/root.dart';
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
    String localEmail ;
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
                  "assets/images/logo.png",
                  width: size.width * 0.35,
                ),
                SizedBox(height: size.height * 0.1),
                RoundedInputField(
                  hintText: "Your email",

                  onClick: (value) {
                    BodyLogin.email = value ;
                    localEmail= value ;
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

                          if(BodyLogin.email.contains("medom") && !(BodyLogin.email.contains('_'))){
                            var emailList = localEmail.split('@');
                           var localEmailName = emailList[0];
                           HomePage.emailName=localEmailName ;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                          }

                         else if (BodyLogin.email=='ka_med@medom.com'){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DoctorPage()));
                          }

                          else{
                            var emailList = localEmail.split('@');
                            var localEmailName = emailList[0];
                            RootAppPrim.emailName=localEmailName ;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RootAppPrim()));
                          }

                        } on FirebaseAuthException catch (e) {
                          final snackBar = SnackBar(content: Text(e.message));
                          Scaffold.of(context).showSnackBar(snackBar);

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
