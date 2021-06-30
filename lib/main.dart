
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/screens/daily_question/dailyq.dart';
import 'package:medom/screens/login/login_page.dart';
import 'package:medom/screens/med/home/home_med.dart';
import 'package:medom/screens/nav/navigation.dart';
import 'package:medom/screens/user/home/home_user.dart';
import 'package:medom/services/services.dart';

import 'constants.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('hello');
  StoreAndGet.firestoreCOll = FirebaseFirestore.instance.collection(kCollection);
  print(StoreAndGet.firestoreCOll.snapshots().toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: RootApp.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomePageMalade.id:(context)=> HomePageMalade(),
        HomePage.id : (context)=> HomePage(),
        DailyQuestion.id : (context)=> DailyQuestion(),
        RootApp.id : (context)=> RootApp(),
      },
    );
  }
}
