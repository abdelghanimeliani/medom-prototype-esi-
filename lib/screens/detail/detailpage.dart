import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/widgets/button.dart';
import 'package:medom/widgets/input.dart';

import '../../constants.dart';

class DetailPage extends StatelessWidget {
  static String id = " ";
  String description , name , temp , age ;
  bool med , toux , gout , res , douleur ;

  DetailPage({this.description, this.name, this.temp, this.age, this.med,
  this.toux, this.gout, this.res, this.douleur});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String consinges = " ";
    var size = MediaQuery.of(context).size ;
 int etat = 0 ;
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          /*  image: DecorationImage(
                image: AssetImage('assets/images/1.png'),
                ),*/
            gradient: LinearGradient(
                colors: [ Colors.blue[50],ksecondaryColor],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Center(

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: size.height*0.05,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Montserrat', color: kPrimaryColor, fontSize: 30 , fontWeight: FontWeight.bold
                    ,),
                ),
                SizedBox(
                  height: 25,
                ),
                Text( "age : "+age +" ans",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    height: 260, child: Image(image: AssetImage('assets/images/3.png'))),
                SizedBox(
                  height: 25,
                ),
                Text( "état actuelle :"
                  ' "' + description + ' "',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(
                  height: 25,
                ),
                Text( "temperature : "+temp + "C",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),


                SizedBox(
                  height: 25,
                ),
                Text( "Vous prenez des medicaments ? : "+ conv(med),
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text( "T'as perdu le gout/ordorat recement ? : "+conv(gout),
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: 25,
                ),


                Text( "Soufrez-vous de douleurs/courbatures ? : "+conv(douleur),
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text( "defeculté de respiration  ? : "+conv(res),
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text( "La toux  ? : "+conv(toux),
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Divider(
                      height: 20,
                      thickness: 3,
                      indent: 20,
                      endIndent: 20,
                      color: kPrimaryColor,
                    ),
                      SizedBox(height: 20),
                      Text(
                        "prenez une decision/ajouter quelques consignes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: kPrimaryColor),
                      ),
                      SizedBox(height: 20),


                      RoundedInputField(
                        hintText: "ajouter quelques consignes ",

                        onClick: (value) {
                          consinges = value ;
                        },
                      ),
                      SizedBox(height: 20),



                      // rak mliiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiih


                      RoundedButton(
                          text: "vous etes en bonne senté",
                          press: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              etat = 0 ;
                              CollectionReference questions = FirebaseFirestore.instance
                                  .collection('questions');
                             await questions.doc(name)
                                  .update({krep : true})
                                  .then((value) => print("User Updated"))
                                  .catchError((error) =>
                                  print("Failed to update user: $error"));

                              CollectionReference reponse = FirebaseFirestore.instance
                                  .collection('reponses');

                              reponse..doc(name).set(
                                  {
                                    'etat': etat ,
                                    'consignes': consinges ,
                                    }
                              )
                                  .then((value) => print(" Added"))
                                  .catchError((error) => print("Failed to add : $error"));

                              Navigator.of(context).pop();
                            }
                          }
                      ),






                      RoundedButton(
                          text: "vous etes en bonne senté mais restez confiné",
                          press: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              etat = 1;
                              CollectionReference questions = FirebaseFirestore.instance
                                  .collection('questions');
                              await questions.doc(name)
                                  .update({krep : true})
                                  .then((value) => print("User Updated"))
                                  .catchError((error) =>
                                  print("Failed to update user: $error"));

                              CollectionReference reponse = FirebaseFirestore.instance
                                  .collection('reponses');

                              reponse..doc(name).set(
                                  {
                                    'etat': etat ,
                                    'consignes': consinges ,
                                  }
                              )
                                  .then((value) => print(" Added"))
                                  .catchError((error) => print("Failed to add : $error"));

                              Navigator.of(context).pop();
                            }
                          }
                      ),


                      RoundedButton(
                          text: "vous devez visiter l'hopital le plus proche de vous",
                          press: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              etat = 2 ;
                              CollectionReference questions = FirebaseFirestore.instance
                                  .collection('questions');
                              await questions.doc(name)
                                  .update({krep : true})
                                  .then((value) => print("User Updated"))
                                  .catchError((error) =>
                                  print("Failed to update user: $error"));

                              CollectionReference reponse = FirebaseFirestore.instance
                                  .collection('reponses');

                              reponse..doc(name).set(
                                  {
                                    'etat': etat ,
                                    'consignes': consinges ,
                                  }
                              )
                                  .then((value) => print(" Added"))
                                  .catchError((error) => print("Failed to add : $error"));

                              Navigator.of(context).pop();
                            }
                          }
                      ),

                      SizedBox(height: size.height * 0.2),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  String conv(bool vall){
    if(vall==true){
      return 'OUI';
    }else{
      return 'NON';
    }
  }
}
