import 'package:fitness/providers/users_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_detail.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign_up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  var name;
  var lastName;
  var emailAddress;
  var password;
  var rePassword;
  var gender;
  void _saveForm() {
    final usersData = Provider.of<UsersDetail>(context, listen: false);

    _formKey.currentState.save();
    usersData.addUser(UserDetail(
        firstName: name,
        lastName: lastName,
        id: emailAddress,
        password: password,
        rePassword: rePassword,
        gender: gender));
    print(gender);
    print(name);
  }

  var nameFocusNode;
  var lastFocusNode;
  var emailFocusNode;
  var passwordFocusNode;
  var rePasswordFocusNode;
  var scaffoldFocusNode;

  @override
  void initState() {
    super.initState();
    scaffoldFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    lastFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    rePasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    scaffoldFocusNode.dispose();
    nameFocusNode.dispose();
    lastFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    rePasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String valueChoose;
    List<String> listItem = ['Male', 'FeMale'];
    return GestureDetector(
      onTap: () {
        return scaffoldFocusNode.requestFocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(top: 78, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Sign Up',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: TextFormField(
                          onSaved: (value) {
                            name = value;
                          },
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(lastFocusNode),
                          decoration: InputDecoration(
                            labelText: 'First Name',
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
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: TextFormField(
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(emailFocusNode),
                          textInputAction: TextInputAction.next,
                          focusNode: lastFocusNode,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2),
                            ),
                          ),
                          onSaved: (value) {
                            lastName = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  buildTextFormField(
                    'Email',
                    TextInputType.emailAddress,
                    false,
                    (value) {
                      emailAddress = value;
                    },
                    emailFocusNode,
                    (value) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  buildTextFormField(
                      'Create Password',
                      TextInputType.visiblePassword,
                      true,
                      (value) {
                        password = value;
                      },
                      passwordFocusNode,
                      (value) {
                        FocusScope.of(context)
                            .requestFocus(rePasswordFocusNode);
                      }),
                  SizedBox(
                    height: 36,
                  ),
                  buildTextFormField(
                      'Re-enter Password',
                      TextInputType.visiblePassword,
                      true,
                      (value) {
                        rePassword = value;
                      },
                      rePasswordFocusNode,
                      (value) {
                        FocusScope.of(context).requestFocus(scaffoldFocusNode);
                      }),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Gender?',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: DropdownButtonFormField(
                      onSaved: (value) {
                        gender = value;
                      },
                      hint: Text('Select Gender'),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      value: valueChoose,
                      isExpanded: true,
                      onChanged: (newValue) {
                        valueChoose = newValue;
                      },
                      items: listItem.map<DropdownMenuItem>((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 47),
                  endButton(),
                ],
              ),
            ),
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
          Navigator.of(context).pop();
          return _saveForm();
        },
        child: Text(
          'Let\'s do this',
          style: TextStyle(
              fontSize: 22, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(String labelText, TextInputType type,
      bool value, Function save, FocusNode node, Function sumbit) {
    return TextFormField(
      focusNode: node,
      onFieldSubmitted: sumbit,
      onSaved: save,
      textInputAction: TextInputAction.next,
      obscureText: value,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
              color: Colors.black, style: BorderStyle.solid, width: 2),
        ),
      ),
    );
  }
}
