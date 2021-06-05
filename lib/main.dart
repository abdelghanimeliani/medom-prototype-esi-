
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medom/screens/login/login_page.dart';
import 'package:medom/screens/med/home/home_med.dart';
import 'package:medom/screens/user/home/home_user.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('hello');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomePageMalade.id:(context)=> HomePageMalade(),
        HomePage.id : (context)=> HomePage(),
      },
    );
  }
}
