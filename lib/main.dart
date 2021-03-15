import 'package:la_mode/provider/modelHud.dart';
import 'package:la_mode/provider/adminMode.dart';
import 'package:la_mode/pages/begin.dart';
import 'package:la_mode/pages/homepage.dart';
import 'package:la_mode/pages/login.dart';
import 'package:la_mode/pages/sign up.dart';
import 'package:la_mode/pages/adminHome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
          create: (context) => ModelHud(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        ),
      ],
      child: MaterialApp(
        initialRoute: BeginScreen.id,
        routes: {
          BeginScreen.id: (context) => BeginScreen(),
          LogIn.id: (context) => LogIn(),
          SignUp.id: (context) => SignUp(),
          HomePage.id: (context) => HomePage(),
          AdminHome.id: (context) => AdminHome()
        },
      ),
    );
  }
}
