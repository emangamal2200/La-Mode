import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mode/components/customTextField.dart';
import 'package:la_mode/pages/homepage.dart';
import 'package:la_mode/pages/login.dart';
import 'package:la_mode/provider/modelHud.dart';
import 'package:la_mode/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';



class SignUp extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SignUpScreen';
  final _auth = Auth();
  String _name,_email, _password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .33,
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
              SizedBox(
                height: height * .01,
              ),
              CustomTextField(
                  onClick: (value) {
                    _name = value;
                  },
                  hint: 'Enter your name',
                  icon: Icons.person),
              SizedBox(
                height: height * .02,
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
                height: height * .04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Builder(
                  builder:(context) => TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () async {
                      final modelHud = Provider.of<ModelHud>(context,listen: false);
                      modelHud.changeIsLoading(true);
                      if (_globalKey.currentState.validate()) {
                        _globalKey.currentState.save();
                        try {
                          final AuthResult =
                          await _auth.signUp(_email, _password);
                          modelHud.changeIsLoading(false);
                          Navigator.pushNamed(context, HomePage.id);
                        } catch (e) {
                          modelHud.changeIsLoading(false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.message),
                          ));
                        }
                      }
                      modelHud.changeIsLoading(false);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ? ',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LogIn.id);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
