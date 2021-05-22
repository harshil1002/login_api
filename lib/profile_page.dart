import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switchValue = false;
  ThemeData _darkThem = ThemeData(brightness: Brightness.dark);
  ThemeData _lightThem = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _switchValue ? _darkThem : _lightThem,
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/images/loginPage01.jpg'),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/images/dark_bg.png'),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _switchValue = !_switchValue;
                              });
                            },
                            child: _switchValue
                                ? Expanded(
                                    child: Image.asset(
                                        'assets/images/sun_lightTheme.png'),
                                  )
                                : Expanded(
                                    child: Image.asset(
                                        'assets/images/moon_darkTheme.png'),
                                  ),
                          ),
                          Icon(
                            _switchValue ? Icons.search_rounded : Icons.close,
                            color: Colors.white,
                          ),
                          _switchValue
                              ? Image.asset('assets/icons/sun_lightTheme.png',
                                  height: 35,
                                  color: Colors.white,
                                  cacheWidth: 500)
                              : Image.asset('assets/icons/moon_darkTheme.png',
                                  height: 35,
                                  color: Colors.black,
                                  cacheWidth: 500),
                          // Icon(
                          //   _switchValue ? Icons.search_rounded : Icons.close,
                          //   color: Colors.white,
                          // ),
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // if (_form.currentState.validate())
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          'https://www.google.com/maps/uv?pb=!1s0x3be0456a49d66ce5:0x1440baa58aadc609!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipMch9mtyD12KDnHPjIDIcs2O6E7FzsxdFHEOaIw%3Dw160-h160-k-no!5sharshil+thummar+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipMch9mtyD12KDnHPjIDIcs2O6E7FzsxdFHEOaIw&hl=en&sa=X&ved=2ahUKEwiR8uTN6bvvAhXoILcAHWvRBKUQoiowE3oECCEQAw',
                        ),
                      ),
                      SizedBox(height: 20),
                      Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PROFILE PHOTO',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Icon(Icons.edit)],
                        ),
                      ]),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        'Harshil Thummar',
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 40,
                        thickness: 2.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        'harshilthummar@gmail.com',
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 40,
                        thickness: 2.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        '**********',
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 40,
                        thickness: 2.5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
