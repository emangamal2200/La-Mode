import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:la_mode/pages/homepage.dart';
import 'package:la_mode/pages/login.dart';
import 'package:la_mode/pages/splash.dart';
import 'package:provider/provider.dart';
import 'package:la_mode/provider/userprovider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(create: (_) => UserProvider.initialize(),
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.black
    ),
    home: ScreensController(),
      )));
  }
  class ScreensController extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final user = Provider.of<UserProvider>(context);
      switch(user.status){
        case Status.Uninitialized:
          return Splash();
        case Status.Unauthenticated:
        case Status.Authenticating:
          return LogIn();
        case Status.Authenticated:
          return HomePage();
        default: return LogIn();
      }
    }
  }
