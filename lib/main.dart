import 'package:flutter/material.dart';
import 'package:login_api/check_credential.dart';
import 'package:login_api/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: GlobalData.themeData,
      darkTheme: GlobalData.darkThemeData,
      themeMode: GlobalData.themeMode,
      home: CheckCredential(),
    );
  }
}