import 'package:flutter/material.dart';
import 'package:nec/driver.dart';
import 'package:nec/idleDriver.dart';

import 'loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      //  theme: myAppTheme,

      home: LoginPage(),
       routes: <String, WidgetBuilder> {
    '/screen1': (BuildContext context) => new Driver(),
    '/screen2' : (BuildContext context) => new IdleDriver()
       },
    
      debugShowCheckedModeBanner: false,
    );
  }
}
