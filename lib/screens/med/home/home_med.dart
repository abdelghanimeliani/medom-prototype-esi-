import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/models/hospital.dart';
import 'package:medom/screens/login/component/back.dart';
import 'package:medom/screens/med/home/component/AdmineCustomForm.dart';
import 'package:medom/widgets/button.dart';
import 'package:medom/widgets/input.dart';
import 'package:medom/widgets/pass_input.dart';

import '../../../constants.dart';

class HomePage extends StatefulWidget {
  static String emailName ;
  static String id = "home for med";
  static String nbrp = '';
 static  String nbrm = '';

  @override
  State<StatefulWidget> createState() {

    return _HomePageState() ;
  }
}

class _HomePageState extends State{
@override
  void initState()async {
    // TODO: implement initState
    super.initState();

      try{

        await  FirebaseFirestore.instance
            .collection('hospitals')
            .doc(HomePage.emailName)
            .get()
            .then((DocumentSnapshot documentSnapshot) {

          if (documentSnapshot.exists) {
            print('kayen');
            print('Document data: ${documentSnapshot.data()}');
            HomePage.nbrm= documentSnapshot.data()[knbrMedecin];
            HomePage.nbrp = documentSnapshot.data()[knbrplaces];
            //adresse = documentSnapshot.data()[kadresse];

          } else {
            print('Document does not exist on the database');
            //  adresse ='-1';
          }
        });
      }catch(e){
        e.message ;
      }


  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    void getData() async {
      try{

        await  FirebaseFirestore.instance
            .collection('hospitals')
            .doc(HomePage.emailName)
            .get()
            .then((DocumentSnapshot documentSnapshot) {

          if (documentSnapshot.exists) {
            print('kayen');
            print('Document data: ${documentSnapshot.data()}');
            HomePage.nbrm= documentSnapshot.data()[knbrMedecin];
            HomePage.nbrp = documentSnapshot.data()[knbrplaces];
            //adresse = documentSnapshot.data()[kadresse];

          } else {
            print('Document does not exist on the database');
            //  adresse ='-1';
          }
        });
      }catch(e){
        e.message ;
      }

    }


    final _formKey = GlobalKey<FormState>();
setState(() {
  getData();
});
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
        body: MyAdmineCustomForm(),
    );
  }
}



