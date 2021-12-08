// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:storemovieinfo/Data/data.dart';
import 'package:storemovieinfo/MainPage/details.dart';
import 'package:storemovieinfo/MainPage/homePage.dart';
import 'package:provider/provider.dart';
import 'package:storemovieinfo/authentication/login.dart';
import 'package:storemovieinfo/authentication/registration.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataFunction()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Registration(),
        routes: {
          Details.routeName: (context) => Details(),
          MainPage.routeName: (context) => MainPage(),
          Registration.id: (context) => Registration(),
          Login.id: (context) => Login()
        },
      ),
    );
  }
}


// ChangeNotifierProvider(create: (context) => ExternalListDetailsFive()),