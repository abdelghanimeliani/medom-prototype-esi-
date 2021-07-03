import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/constants.dart';
import 'package:medom/screens/daily_question/dailyq.dart';

import 'package:medom/screens/user/home/home_user.dart';

import 'package:flutter_icons/flutter_icons.dart';



class RootAppPrim extends StatefulWidget {
  static String emailName ;
  static String id ="id wkhlas";
  @override
  _RootAppPrimState createState() => _RootAppPrimState();
}

class _RootAppPrimState extends State<RootAppPrim> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePageMalade(),

        DailyQuestion(),

      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.ios_home,
      Ionicons.md_medical
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: ksecondaryColor,
        activeIndex: pageIndex,
        inactiveColor: kPrimaryColor.withOpacity(0.5),
        splashColor:ksecondaryColor ,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        onTap: (index) {
          selectedTab(index);
        });
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}