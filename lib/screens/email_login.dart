import 'package:fitness/screens/dashboard.dart';
import 'package:provider/provider.dart';
import '../providers/users_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:provider/provider.dart';
// import '../providers/users_detail.dart';

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
  static const rotueName = '/email_login';
}

class _EmailLoginState extends State<EmailLogin> {
  final _formKey = GlobalKey<FormState>();
  var emailAddress;
  var password;
  var emailFocusNode;
  var passwordFocusNode;

  void _saveForm() {
    final usersData = Provider.of<UsersDetail>(context, listen: false);

    _formKey.currentState.save();
    // print(emailAddress);
    // print(password);
    fetchAndLogin(emailAddress, password);
    usersData.loggedUser(emailAddress);
  }

  @override
  void initState() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 78, left: 30, right: 30),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 78,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
              ),
              TextFormField(
                focusNode: emailFocusNode,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(passwordFocusNode),
                onSaved: (value) {
                  emailAddress = value;
                },
                textInputAction: TextInputAction.next,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              TextFormField(
                focusNode: passwordFocusNode,
                onSaved: (value) {
                  password = value;
                },
                textInputAction: TextInputAction.done,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              endButton(),
            ],
          ),
        ),
      ),
    );
  }

  Container endButton() {
    return Container(
      height: 60,
      width: 353,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(66, 103, 178, 1),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
        onPressed: () {
          return _saveForm();
        },
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 22, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> fetchAndLogin(String id, String password) async {
    var url = Uri.parse('https://water-notification.firebaseio.com/users.json');
    try {
      final response = await http.get(url);
      print(url);
      final extractedData = json.decode(response.body) as Map<dynamic, dynamic>;

      extractedData.forEach((userId, userData) {
        if ((userData['email'] == id) && (userData['password'] == password)) {
          print('working');

          return Navigator.of(context)
              .pushReplacementNamed(DashBoard.routeName);
        } else {
          print('too bad');
        }
      });
    } catch (error) {
      throw (error);
    }
  }
}
