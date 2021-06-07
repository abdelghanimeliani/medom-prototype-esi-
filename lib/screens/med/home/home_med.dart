import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/models/hospital.dart';
import 'package:medom/screens/login/component/back.dart';
import 'package:medom/widgets/button.dart';
import 'package:medom/widgets/input.dart';
import 'package:medom/widgets/pass_input.dart';

import '../../../constants.dart';

class HomePage extends StatefulWidget {

  static String id = "home for med";

  @override
  State<StatefulWidget> createState() {
    return _HomePageState() ;
  }
}

class _HomePageState extends State{

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String nbrp,nbrm ,adresse  ;

/*initState() async {
  try{
    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc("mbacha")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      print('makach');
      if (documentSnapshot.exists) {
        print('kayen');
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');

      }
    });
  }catch(e){
    e.message ;
  }

}*/

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("ADMIN", style: TextStyle(
                color: kPrimaryLightColor ,
                fontFamily: 'Montserrat',
                fontSize: 17.0,
                fontWeight: FontWeight.bold
            )),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Form(
            key: _formKey,
            child: Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text(
                      "ADMIN INTERFACE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: kPrimaryColor),
                    ),

                    SizedBox(height: size.height * 0.03),

                    Text(
                      "nombre de places libre actuel : " + nbrp,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: kPrimaryColor),
                    ),

                    SizedBox(height: size.height * 0.03),

                    Text(
                      "nombre de medecins en garde : " + nbrm,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: kPrimaryColor),
                    ),

                    SizedBox(height: size.height * 0.03),
                    Text(
                      "adresse : " + adresse ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: kPrimaryColor),
                    ),
                    SizedBox(height: size.height * 0.1),
                    RoundedInputField(
                      hintText: "nombre de places libres :",
                      onChanged: (value) {},
                      onClick: (value) {
                        //BodyLogin.email;
                      },
                    ),
                    RoundedInputField(
                      hintText: "nombre de medecins :",
                      onChanged: (value) {},
                      onClick: (value) {
                        //BodyLogin.email;
                      },
                    ),
                    RoundedButton(
                        text: "ACTUALISER",
                        press: () {
                          if (_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            print("********************************");
                          }

                        }

                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
