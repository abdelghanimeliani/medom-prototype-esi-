import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'id ta3 thanks' ;
  @override
  Widget build(BuildContext context) {

var size = MediaQuery.of(context).size ;
    return Scaffold(
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

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                height: size.height*0.23,
              ),
              Text(
                'Vous avez deja repondu !',
                style: TextStyle(
                    fontFamily: 'Montserrat', color: kPrimaryColor, fontSize: 30 , fontWeight: FontWeight.bold
                ,),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  height: 260, child: Image(image: AssetImage('assets/images/2.png'))),
              SizedBox(
                height: 25,
              ),
              Text(
                "Merci d'attendre la réponse de votre medecin",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}