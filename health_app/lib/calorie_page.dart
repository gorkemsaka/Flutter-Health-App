import 'package:flutter/material.dart';
import 'package:health_app/calorie_calculate_page.dart';
import 'package:health_app/calorie_parameters.dart';
import 'package:health_app/constans.dart';

class CaloriePage extends StatefulWidget {
  @override
  _CaloriePageState createState() => _CaloriePageState();
}

class _CaloriePageState extends State<CaloriePage> {
  String gender;
  List<String> manGender = ['man', 'manSelected'];
  List<String> womenGender = ['women', 'womenSelected'];
  double weight = 1, fatRate = 1, exercise = 1;
  int womenIndex = 0;
  int manIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Calorie"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              child: Image.asset(
                                  'assets/images/${manGender[manIndex]}.png'),
                              onTap: () {
                                gender = 'man';
                                setState(() {
                                  if (gender == 'man') {
                                    manIndex = 1;
                                    womenIndex = 0;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: GestureDetector(
                              child: Image.asset(
                                  'assets/images/${womenGender[womenIndex]}.png'),
                              onTap: () {
                                gender = 'women';
                                setState(() {
                                  if (gender == 'women') {
                                    womenIndex = 1;
                                    manIndex = 0;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          (weight.toInt()).toString(),
                          style: kNumbersStyle,
                        ),
                        Slider(
                          value: weight,
                          label: weight.toString(),
                          onChanged: (double newValue) {
                            setState(() {
                              weight = newValue;
                            });
                          },
                          min: 1,
                          max: 200,
                        ),
                        Text(
                          'Enter Your Weight (KG)',
                          style: kWordsStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          '%${(fatRate.toInt()).toString()}',
                          style: kNumbersStyle,
                        ),
                        Slider(
                          value: fatRate,
                          label: fatRate.toString(),
                          onChanged: (double newValue) {
                            setState(() {
                              fatRate = newValue;
                            });
                          },
                          min: 1,
                          max: 50,
                        ),
                        Text(
                          'Enter Your Fat Rate (%)',
                          style: kWordsStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          (exercise.toInt()).toString(),
                          style: kNumbersStyle,
                        ),
                        Slider(
                          value: exercise,
                          label: exercise.toString(),
                          onChanged: (double newValue) {
                            setState(() {
                              exercise = newValue;
                            });
                          },
                          min: 1,
                          max: 7,
                        ),
                        Text(
                          'How Many Days A Week Do You Exercise?',
                          style: kWordsStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text('Calculate!'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => calorieCalculatePage(
                                  CalorieParameters(
                                      exercise: exercise,
                                      fatRate: fatRate,
                                      weight: weight,
                                      gender: gender),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
