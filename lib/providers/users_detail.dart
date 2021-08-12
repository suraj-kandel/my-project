import 'package:fitness/providers/user_detail.dart';
import 'package:fitness/screens/email_login.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersDetail with ChangeNotifier {
  List<UserDetail> _items = [];
  String id;
  String gender;

  List<UserDetail> get items {
    return [..._items];
  }

  Future<void> addUser(UserDetail userDetail) async {
    var url = Uri.parse('https://water-notification.firebaseio.com/users.json');
    try {
      await http.post(
        url,
        body: json.encode({
          'name': userDetail.firstName,
          'lastName': userDetail.lastName,
          'email': userDetail.id,
          'password': userDetail.password,
          'rePassword': userDetail.rePassword,
          'gender': userDetail.gender,
        }),
      );
    } catch (error) {
      {
        throw (error);
      }
    }

    notifyListeners();
  }

  loggedUser(email) {
    id = email;
    print(id);
    notifyListeners();
  }

  Future currentUser() async {
    var url = Uri.parse('https://water-notification.firebaseio.com/users.json');
    await http.get(url);
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((key, value) {
      if (id == value['email']) {
        gender = value['gender'];
        print(gender);
      }
    });
  }

  get email {
    return id;
  }

  get haha {
    return gender;
  }
}
