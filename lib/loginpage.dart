import 'package:flutter/material.dart';
// import 'package:nec/driver.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'signin.dart';

import 'idleDriver.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // new Expanded(
      //   flex:0,
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/index.png"), height: 150.0),
              SizedBox(height: 35),
              _signInUButton(),
              // SizedBox(height: 5),
              // _signInDButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInUButton() {
    return RaisedButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return IdleDriver();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//   Widget _signInDButton() {
//     return RaisedButton(
//       splashColor: Colors.white,
//       onPressed: () {
//         signInWithGoogle().whenComplete(() {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) {
//                 return Driver();
//               },
//             ),
//           );
//         });
//       },
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//       highlightElevation: 0,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Text(
//                 'Sign in as driver with Google',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black87,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
 }
