// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storemovieinfo/MainPage/homePage.dart';
import 'package:storemovieinfo/authentication/login.dart';

class Registration extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/BackImg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Center(
              child: Container(
                  padding: EdgeInsets.all(25.0),
                  margin: EdgeInsets.only(left: 25.0, right: 25.0),
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        // textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration:
                            InputDecoration(hintText: 'Enter your Email'),
                        // decoration:
                        //     kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextField(
                        obscureText: true,
                        // textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration:
                            InputDecoration(hintText: 'Enter your Password'),
                        // decoration: kTextFieldDecoration.copyWith(
                        //     hintText: 'Enter your password'),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            await _auth.createUserWithEmailAndPassword(
                                email: email!, password: password!);

                            Navigator.pushNamed(context, MainPage.routeName);

                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Container(
                          // color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Icon(
                                Icons.login_rounded,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: Container(
                          child: Text(
                            'Already have an account? Login',
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
