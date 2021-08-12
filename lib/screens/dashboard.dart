import 'package:fitness/screens/bmi.dart';
import 'package:fitness/screens/calorie.dart';
import 'package:fitness/screens/exercise.dart';
import 'package:fitness/screens/water.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  static const routeName = '/dashboard';
  List views = [
    {
      'title': 'Check your',
      'subTitle': 'BMI',
      'ImageUrl': 'lib/assets/tape.png',
      'push': Bmi.routeName,
    },
    {
      'title': 'check your',
      'subTitle': 'Water Intake',
      'ImageUrl': 'lib/assets/water.png',
      'push': Water.routeName,
    },
    {
      'title': 'check your',
      'subTitle': 'Calorie Intake',
      'ImageUrl': 'lib/assets/food.png',
      'push': Calorie.routeName,
    },
    {
      'title': 'Get your',
      'subTitle': 'Exercise Routine',
      'ImageUrl': 'lib/assets/yoga.png',
      'push': Exercise.routeName,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: 30, right: 30, top: MediaQuery.of(context).size.height / 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Image(
                    image: AssetImage('lib/assets/logo.png'),
                  ),
                ),
                Container(
                  child: Image(
                    image: AssetImage('lib/assets/placeholder.png'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Text(
              'Get Started',
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Select an option',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: views.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(views[index]['push']);
                    },
                    child: Card(
                      shadowColor: Colors.white,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        height: 132,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                views[index]['ImageUrl'],
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              views[index]['title'],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              views[index]['subTitle'],
                              style: TextStyle(
                                  fontSize: 34,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
