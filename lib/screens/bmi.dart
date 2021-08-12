import 'package:fitness/widgets/calculate.dart';
import 'package:fitness/widgets/field.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  static const routeName = '/bmi';

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final _formKey = GlobalKey<FormState>();
  String weight;
  String height;
  List<String> metric = ['kg', 'po'];
  List<String> forHeight = ['in', 'm'];
  String valueWeight;
  String valueHeight;
  String bmiValue;
  void onSave() {
    _formKey.currentState.save();
    calculateBMI();
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
                image: AssetImage('lib/assets/bmi_background.png'),
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
                'Calculate your BMI',
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
              Calculate(
                  label: 'Calculate',
                  toDo: () {
                    setState(() {
                      onSave();
                    });
                  }),
              SizedBox(height: 20),
              if (bmiValue != null)
                Text(
                  ' You BMI index is $bmiValue',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              Text(
                ' Underweight = <18.5',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                ' Normal weight = 18.5–24.9 ',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                ' Overweight = 25–29.9',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                ' Obesity = BMI of 30 or greater',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  calculateBMI() {
    if (valueHeight == 'm' && valueWeight == 'kg') {
      double value =
          double.parse(weight) / (double.parse(height) * double.parse(height));
      bmiValue = value.toStringAsFixed(2);
    } else if (valueHeight == 'in' && valueWeight == 'kg') {
      double toMeter = double.parse(height) * 0.352250489;
      double value = double.parse(weight) / (toMeter * toMeter);
      bmiValue = value.toStringAsFixed(2);
    } else if (valueHeight == 'm' && valueWeight == 'po') {
      double toKg = double.parse(weight) / 2.205;
      double value = toKg / (double.parse(height) * double.parse(height));
      bmiValue = value.toStringAsFixed(2);
    } else if (valueHeight == 'in' && valueWeight == 'po') {
      double toMeter = double.parse(height) * 0.352250489;
      double toKg = double.parse(weight) / 2.205;
      double value = toKg / (toMeter * toMeter);
      bmiValue = value.toStringAsFixed(2);
    }
  }
}
