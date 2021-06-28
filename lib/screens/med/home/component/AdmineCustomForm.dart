import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medom/screens/login/component/back.dart';
import 'package:medom/screens/med/home/home_med.dart';
import 'package:medom/screens/user/home/home_user.dart';
//import 'package:medom/services/auth.dart';
//import 'package:medom/services/auth.dart';
import 'package:medom/widgets/button.dart';
import 'package:medom/widgets/input.dart';
import 'package:medom/widgets/pass_input.dart';

import '../../../../constants.dart';


// Define a custom Form widget.
class MyAdmineCustomForm extends StatefulWidget {
  @override
  MyAdmineCustomFormState createState() {
    return MyAdmineCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyAdmineCustomFormState extends State<MyAdmineCustomForm> {


  CollectionReference users = FirebaseFirestore.instance
      .collection('hospitals');
  Future<void> updateUser(String nm ,String np) {
    return users
        .doc(HomePage.emailName)
        .update({knbrMedecin: nm ,
      knbrplaces:np})
        .then((value) => print("User Updated"))
        .catchError((error) =>
        print("Failed to update user: $error"));
  }

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
                  "Interface Administrateur",
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
                  hintText: "nombre de places libres "+ HomePage.nbrp,

                  onClick: (value) {
                   setState(() {
                     HomePage.nbrp =value;
                   });
                  },
                ),
                SizedBox(height: size.height * 0.01),

                RoundedInputField(
                  hintText: "nombre de medecins en garde "+ HomePage.nbrm,

                  onClick: (value) {
                    HomePage.nbrm =value;
                  },
                ),
                RoundedButton(
                    text: "actualiser",
                    press: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        setState(() {
                          updateUser(HomePage.nbrm, HomePage.nbrp);
                        });
                      }
                    } ),
              ],
            ),
          ),
        ));
  }


}