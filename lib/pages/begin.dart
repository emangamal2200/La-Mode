import 'package:la_mode/pages/login.dart';
import 'package:la_mode/pages/sign up.dart';
import 'package:flutter/material.dart';

class BeginScreen extends StatelessWidget {
  static String id = 'BeginScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .51,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/logo2.png',
                    height: 300.0,
                    width: 300.0,
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 5),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, SignUp.id);
              },
              child: Text(
                'Sign up',
                style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Pacifico' ),
              ),
            ),
          ),
          SizedBox(
            height: height * .01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 5),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, LogIn.id);
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Pacifico'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
