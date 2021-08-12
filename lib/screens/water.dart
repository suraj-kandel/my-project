import 'package:fitness/widgets/calculate.dart';

import 'package:flutter/material.dart';

class Water extends StatefulWidget {
  static const routeName = '/water';

  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  final _formKey = GlobalKey<FormState>();
  String weight;
  String height;
  List<String> metric = ['kg', 'po'];
  String drink;
  String valueWeight;

  void onSave() {
    _formKey.currentState.save();
    waterIntake();
    print(weight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/water_background.png'),
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
                'Daily Water Intake',
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
              SizedBox(
                height: 30,
              ),
              Calculate(
                label: 'Calculate',
                toDo: () {
                  setState(() {
                    onSave();
                  });
                },
              ),
              SizedBox(height: 20),
              if (drink != null)
                Text(
                  ' You should drink $drink litres of water daily',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
            ],
          ),
        ),
      ),
    );
  }

  waterIntake() {
    if (valueWeight == 'po') {
      double value = double.parse(weight) * (2 / 3);
      double liter = value / 33.814;
      drink = liter.toStringAsFixed(2);
    } else if (valueWeight == 'kg') {
      double weightToPound = double.parse(weight) * 2.205;
      double value = weightToPound * (2 / 3);
      double liter = value / 33.814;
      drink = liter.toStringAsFixed(2);
    } else if (valueWeight == null) {
      drink = 'please enter a weight';
    }
  }
}
