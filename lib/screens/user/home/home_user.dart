import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/constants.dart';

class HomePageMalade extends StatelessWidget {
  static String id = "home for user";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text("home for user", style: TextStyle(
           color: kPrimaryLightColor ,
           fontFamily: 'Montserrat',
           fontSize: 17.0,
           fontWeight: FontWeight.bold 
        )),
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
                        child: ListView(children: [
                          _buildFoodItem('FA', 'Salmon bowl', '\$24.00'),
                          _buildFoodItem('ma', 'Spring bowl', '\$22.00'),
                          _buildFoodItem('BA', 'Avocado bowl', '\$26.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                          _buildFoodItem('MB', 'Berry bowl', '\$24.00'),
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String N, String hospitalName, String adress) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
          /*nTap: () {
              //Navigator.of(context).push(MaterialPageRoute(
                 // builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
              ));
            },*/
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Row(children: [
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
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 50.0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(hospitalName,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text(adress,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: ksecondaryColor,
                      ))
                ])
              ])),
              IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: kPrimaryColor,
                  onPressed: () {})
            ],
          ),
        ));
  }
}
