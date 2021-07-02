import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class DoctorPage extends StatefulWidget {
  static String id ="id wkhlas 3 ";
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    Widget _buildItem(String N,
        String username,
        String age ,
        String desc  ,
        String temp,
        bool toux ,
        bool res ,
        bool gout,
        bool douleur ,
        bool med ,
        ) {
      return Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: InkWell(
            onTap: () {

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child:Column(
                      children: [Row(children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(bottom: 15.0),
                          decoration: BoxDecoration(
                              color: kPrimaryColor, shape: BoxShape.circle),
                          child: Text(
                            N,
                            style: TextStyle(
                                color: kPrimaryLightColor,
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),


                        SizedBox(width: 30.0),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(username,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10.0),


                              Text(age.toString() + " ans" ,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: kPrimaryColor,
                                  )),

                              SizedBox(height: 10.0),
                              Text( '" '+desc+' "',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: kPrimaryColor,
                                  )),

                              SizedBox(height: 10.0),


                              Text("temperature : "+temp,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13.0,
                                    color: Colors.red,
                                  ))
                            ]),


                      ])
                        ,SizedBox(height: 10.0,)],
                    )),


                Icon(
                    Icons.arrow_forward  ,
                    color: ksecondaryColor,
                    ),

              ],
            ),
          ));
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          title: Center(
            child: Text("Patiens", style: TextStyle(
                color: kPrimaryLightColor ,
                fontFamily: 'Montserrat',
                fontSize: 17.0,
                fontWeight: FontWeight.bold
            )),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height - 50.0,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('questions').where('rep', isEqualTo: false).snapshots(),
                            // ignore: missing_return
                            builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
                              if(!snapshot.hasData){
                                return Center(
                                  child: Text(
                                    'Loading...',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                );
                              }else{
                                return new ListView.builder(
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context,index){
                                      DocumentSnapshot itemdata = snapshot.data.docs[index];
                                      return _buildItem(
                                          itemdata["n"],
                                          itemdata["idoc"],
                                          itemdata[kage].toString(),
                                          itemdata[kdescription],
                                          itemdata['tempi'],
                                          itemdata[ktoux],
                                          itemdata[kres] ,
                                          itemdata[kgout],
                                          itemdata[kdouleur],
                                          itemdata[kmed] );
                                    });
                              }




                              },
                          )

                      )

                  )
                ]              ,
              ),


            )
          ],
        ),
      ),
    );
  }
}
