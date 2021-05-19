import 'package:flutter/material.dart';
import 'package:login_api/global_data.dart';
import 'package:login_api/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: GlobalData.themeData,
      darkTheme: GlobalData.darkThemeData,
      themeMode: GlobalData.themeMode,
      home: LoginPage(),
    );
  }
}