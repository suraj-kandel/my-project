import 'package:fitness/widgets/calculate.dart';
import 'package:fitness/widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/users_detail.dart';

class Calorie extends StatefulWidget {
  static const routeName = '/calorie';

  @override
  _CalorieState createState() => _CalorieState();
}

class _CalorieState extends State<Calorie> {
  final _formKey = GlobalKey<FormState>();
  var usersData;
  String bmr;
  String weight;
  String gender;
  String height;
  String age;
  List<String> metric = ['kg'];
  List<String> forHeight = ['in'];
  String valueWeight;
  String valueHeight;
  void onSave() {
    usersData = Provider.of<UsersDetail>(context, listen: false);
    caloire();
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/calorie_background.png'),
                  fit: BoxFit.cover),
            ),
            padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: MediaQuery.of(context).size.height / 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '<Back',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      child: Image(
                        image: AssetImage('lib/assets/placeholder.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Daily Calorie Intake',
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 8,
                      child: TextFormField(
                        onSaved: (value) {
                          weight = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Weight',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField(
                          onSaved: (value) {
                            valueWeight = value;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          value: valueWeight,
                          isExpanded: true,
                          onChanged: (newValue) {
                            valueWeight = newValue;
                          },
                          items: metric.map<DropdownMenuItem>((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 8,
                      child: TextFormField(
                        onSaved: (value) {
                          height = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Height',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField(
                          onSaved: (value) {
                            valueHeight = value;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          value: valueHeight,
                          isExpanded: true,
                          onChanged: (newValue) {
                            valueHeight = newValue;
                          },
                          items: forHeight.map<DropdownMenuItem>((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  //padding: EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter Your age',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    onSaved: (value) {
                      age = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Calculate(
                  label: 'Calculate',
                  toDo: onSave,
                ),
                SizedBox(
                  height: 20,
                ),
                if (bmr != null)
                  Text(
                    ' Your Calorie intake should be $bmr kilojoule',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                SizedBox(
                  height: 10,
                ),
                if (bmr != null)
                  Text(
                    ' Please note that this applies to the people who have little to no exercise in their day to day life.',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
              ],
            )),
      ),
    );
  }

  void caloire() {
    usersData.currentUser();
    print(usersData.haha);
    gender = usersData.haha;
    print(gender);
    if (gender == 'Male') {
      setState(() {
        bmr = ((66.47 +
                    13.75 * double.parse(weight) +
                    5.003 * (double.parse(height) * 35.2915851) -
                    (6.755 * double.parse(age))) *
                1.2)
            .toStringAsFixed(2);
      });
    } else if (gender == 'Female') {
      setState(() {
        bmr = ((655.1 +
                    9.563 * double.parse(weight) +
                    1.850 * (double.parse(height) * 35.2915851) -
                    (4.676 * double.parse(age))) *
                1.2)
            .toStringAsFixed(2);
      });
    }
  }
}
