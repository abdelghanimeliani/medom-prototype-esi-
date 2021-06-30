import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker_ui/pages/budget.dart';
import 'package:budget_tracker_ui/pages/create_budgert.dart';
import 'package:budget_tracker_ui/pages/dayli_page.dart';
import 'package:budget_tracker_ui/pages/profile_page.dart';
import 'package:budget_tracker_ui/pages/state_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/constants.dart';
import 'package:medom/screens/user/home/home_user.dart';
import '../theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedTab(4);
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
       HomePageMalade(),

      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.ios_person,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: kPrimaryColor,
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