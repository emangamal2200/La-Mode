import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_mode/pages/adminHome.dart';
import 'package:la_mode/pages/homepage.dart';
import 'package:la_mode/pages/sign up.dart';
import 'package:la_mode/provider/adminMode.dart';
import 'package:la_mode/provider/modelHud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:la_mode/components/customTextField.dart';
import 'package:la_mode/services/auth.dart';
class LogIn extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'LoginPage';
  final _auth = Auth();
  String _email, _password;
  bool isAdmin = false;
  final adminPassword = '666666';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Provider
            .of<ModelHud>(context)
            .isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .35,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'images/logo2.png',
                        height: 250.0,
                        width: 250.0,
                      ),
                    ],
                  ),
                ),
              ),
              CustomTextField(
                  onClick: (value) {
                    _email = value;
                  },
                  hint: 'Enter your email',
                  icon: Icons.email),
              SizedBox(
                height: height * .02,
              ),
              CustomTextField(
                  onClick: (value) {
                    _password = value;
                  },
                  hint: 'Enter your password',
                  icon: Icons.lock),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Builder(
                  builder: (context) =>
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          _validate(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ? ',
                    style: TextStyle(color: Color(0xFF4b5763), fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUp.id);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<AdminMode>(context, listen: false)
                                .changeIsAdmin(true);
                          },
                          child: Text(
                            'i\'m an admin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Provider
                                  .of<AdminMode>(context)
                                  .isAdmin
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        )),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<AdminMode>(context, listen: false)
                                .changeIsAdmin(false);
                          },
                          child: Text(
                            'i\'m a user',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Provider
                                  .of<AdminMode>(context)
                                  .isAdmin
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async{
    final modelHud = Provider.of<ModelHud>(context,listen: false);
    modelHud.changeIsLoading(true);
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      if (Provider.of<AdminMode>(context,listen: false).isAdmin) {
        if (_password == adminPassword) {
          try {
            await _auth.signIn(_email, _password);
            Navigator.pushNamed(context, AdminHome.id);
          } catch (e) {
            modelHud.changeIsLoading(false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(e.message),
            ));
          }
        } else {
          modelHud.changeIsLoading(false);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Something went wrong'),
          ));
        }
      } else {
        try {
          await _auth.signIn(_email, _password);
          Navigator.pushNamed(context, HomePage.id);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message),
          ));
        }
      }
    }
    modelHud.changeIsLoading(false);
  }
  }



