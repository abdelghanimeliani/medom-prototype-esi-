import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:medom/models/hospital.dart';
import 'package:medom/services/services.dart';

class HomePageMalade extends StatefulWidget {
  static String id = "home for user";

  @override
  State<StatefulWidget> createState() {

    return _stateHomePageMalade();
  }


}



class _stateHomePageMalade extends State<HomePageMalade> {
  @override
  Widget build(BuildContext context) {
   List <Hospital> hopi ;
String zero = '0';

initState() async {
  hopi =await  StoreAndGet.loadHospitals();
}

    Widget _buildItem(String N, String hospitalName, String adress , String nbrPlaces , String nbrMedecins) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
          /*nTap: () {
              //Navigator.of(context).push(MaterialPageRoute(
                 // builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
              ));
            },*/
          child: SingleChildScrollView(
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
                              Text(hospitalName,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10.0),


                              Text("nombre de places libres : " + nbrPlaces,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: kPrimaryColor,
                                  )),

                              SizedBox(height: 10.0),
                              Text("nombre de medecins  : " + nbrMedecins,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: kPrimaryColor,
                                  )),

                              SizedBox(height: 10.0),

                              Text(adress,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13.0,
                                    color: ksecondaryColor,
                                  ))
                            ]),


                      ])
                      ,SizedBox(height: 10.0,)],
                    )),


                IconButton(
                    icon: nbrPlaces.hashCode==zero.hashCode ? Icon(Icons.not_interested_outlined) :  Icon(Icons.check)  ,
                    color: nbrPlaces.hashCode==zero.hashCode ? Colors.red : Colors.green,
                    onPressed: () {}),


              ],
            ),
          ),
        ));
  }

   //  Stream<QuerySnapshot> _usersStream ;
   /* initState(){
      super.initState();
      _usersStream = FirebaseFirestore.instance.collection('hospitals').snapshots();
      print(_usersStream.toString());
    }*/


    //var db = FirebaseDatabase.instance.reference().child('hospitals');

    return MaterialApp(
      home: Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          title: Center(
            child: Text("Hopitaux", style: TextStyle(
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
                            stream: FirebaseFirestore.instance.collection('hospitals').snapshots(),
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
                                    return _buildItem(itemdata[kabrv], itemdata[kname], itemdata[kadresse], itemdata[knbrplaces], itemdata[knbrMedecin]);
                                    });
                              }



                            },
                          )

                          )
                         /* StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('hospitals').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                                return ListView(
                                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                                    print(document.data);
                                   // return _buildItem(document.data()['abrv'], document.data()['name'], document.data()['adresse']);
                                  }).toList(),
                                );
                            },
                          )*/
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



















