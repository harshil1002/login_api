import 'package:flutter/material.dart';
import 'package:login_api/profile_page.dart';
import 'package:login_api/singup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckCredential extends StatefulWidget {
  const CheckCredential({Key key}) : super(key: key);

  @override
  _CheckCredentialState createState() => _CheckCredentialState();
}

class _CheckCredentialState extends State<CheckCredential> {
  @override
  void initState() {
    super.initState();
    checkCredentials();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
  void checkCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("TOKEN") != null && prefs.getString("TOKEN") != "") {
      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
    }else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SingUPPage()));
    }
  }
}
