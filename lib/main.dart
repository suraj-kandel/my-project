import 'package:fitness/screens/bmi.dart';
import 'package:fitness/screens/calorie.dart';
import 'package:fitness/screens/dashboard.dart';
import 'package:fitness/screens/email_login.dart';
import 'package:fitness/screens/exercise.dart';
import 'package:fitness/screens/sign_up.dart';
import 'package:fitness/screens/water.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import './providers/users_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UsersDetail(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color.fromRGBO(66, 103, 178, 1)),
        home: SplashScreen(),
        routes: {
          Exercise.routeName: (ctx) => Exercise(),
          Calorie.routeName: (ctx) => Calorie(),
          Water.routeName: (ctx) => Water(),
          Bmi.routeName: (ctx) => Bmi(),
          EmailLogin.rotueName: (ctx) => EmailLogin(),
          SignUp.routeName: (ctx) => SignUp(),
          DashBoard.routeName: (ctx) => DashBoard(),
        },
      ),
    );
  }
}
