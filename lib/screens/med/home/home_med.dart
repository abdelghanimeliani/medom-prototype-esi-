import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                      "cite abdelmoumen 116 -BLIDA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: kPrimaryColor),
                    ),
                    SizedBox(height: size.height * 0.1),
                    RoundedInputField(
                      hintText: "nombre de places libres",
                      onChanged: (value) {},
                      onClick: (value) {
                        //BodyLogin.email;
                      },
                    ),
                    RoundedInputField(
                      hintText: "nombre de medecins en garde",
                      onChanged: (value) {},
                      onClick: (value) {
                        //BodyLogin.email;
                      },
                    ),
                    RoundedButton(
                        text: "SUBMIT",
                        press: () {
                          if (_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            print("********************************");
                          }

                        }

                      /*async {
                     {

                      try {
                        final result =
                            await signIn(BodyLogin.email, BodyLogin.password);
                        Navigator.pushNamed(context, HomePageUser.id);
                        print("c bon ");
                        print(BodyLogin.email);
                      } catch (e) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(e.message)));
                      }
                    }
                  },*/
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
