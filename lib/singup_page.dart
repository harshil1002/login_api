import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:login_api/config.dart';
import 'package:login_api/login_page.dart';
import 'package:login_api/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUPPage extends StatefulWidget {
  @override
  _SingUPPageState createState() => _SingUPPageState();
}

class _SingUPPageState extends State<SingUPPage> {
  bool _hidePass = true;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/loginPage01.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 430,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.7),
                            Colors.lightBlue,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.all(15),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.person_outline),
                                            hintText: 'Name',
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(13),
                                              ),
                                            ),
                                          ),
                                          onChanged: (val) => name = val,
                                          validator: (_name) {
                                            bool _nameValid =
                                                RegExp(r"^[a-zA-Z]+$")
                                                    .hasMatch(_name);
                                            if (_name.isEmpty)
                                              return 'Please Enter Your Name';
                                            if (!_nameValid)
                                              return 'Please Enter Valid Name';
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(13),
                                            ),
                                          ),
                                        ),
                                        onChanged: (val) => email = val,
                                        validator: (_email) {
                                          bool _emailValid = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(_email);
                                          if (_email.isEmpty)
                                            return 'Please Enter Your Email';
                                          if (!_emailValid)
                                            return 'Please Enter Valid Email';
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        obscureText: _hidePass,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.vpn_key),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(13),
                                            ),
                                          ),
                                          suffixIcon: GestureDetector(
                                            child: Icon(_hidePass
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onLongPress: () => {
                                              setState(() => _hidePass = false),
                                            },
                                            onLongPressEnd: (_) => {
                                              setState(() => _hidePass = true),
                                            },
                                          ),
                                        ),
                                        onChanged: (val) => password = val,
                                        validator: (_password) {
                                          bool _passwordValid =
                                              RegExp(r"^[0-9]+$")
                                                  .hasMatch(_password);
                                          if (_password.isEmpty)
                                            return 'Please Enter Your Password';
                                          if (!_passwordValid)
                                            return 'Please Enter Valid Password';
                                          if (_password.length < 6)
                                            return 'Please Enter Valid Password';
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: signupApi,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: FractionalOffset
                                                      .topCenter,
                                                  end: FractionalOffset
                                                      .bottomCenter,
                                                  colors: [
                                                    Colors.white
                                                        .withOpacity(0.7),
                                                    Colors.lightBlue,
                                                  ],
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    spreadRadius: 0.5,
                                                    blurRadius: 15,
                                                    offset: Offset(2, 2),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(13),
                                                ),
                                              ),
                                              child: Text(
                                                'Sing Up',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // if (_form.currentState.validate())
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()),
                                              );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: FractionalOffset
                                                      .topCenter,
                                                  end: FractionalOffset
                                                      .bottomCenter,
                                                  colors: [
                                                    Colors.white
                                                        .withOpacity(0.7),
                                                    Colors.lightBlue,
                                                  ],
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    spreadRadius: 0.5,
                                                    blurRadius: 15,
                                                    offset: Offset(2, 2),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(13),
                                                ),
                                              ),
                                              child: Text(
                                                'Login',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signupApi() async {
    if (_form.currentState.validate()) {
      var response =
          await post(Uri.parse("${AppConfig.baseUrl}/response"), body: {
        "name": "$name",
        "email": "$email",
        "password": "$password",
        "device_token": "2fc80fec0483e2b54baf0a879088d770",
        "device_type": "${Platform.isAndroid ? "android" : "ios"}",
        "device_id": "1231231231"
      });
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("TOKEN", decoded["data"]["token"]);
        Fluttertoast.showToast(
          msg: "${decoded["message"]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ProfilePage()));
      } else if (response.statusCode == 400) {
        var decoded = jsonDecode(response.body);
        List errors = decoded["data"]["error"];
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    children: errors.map((e) => Text(e)).toList(),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'))
                  ],
                ));
      }
    }
  }
}
