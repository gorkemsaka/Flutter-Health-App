import 'package:flutter/material.dart';
import 'package:health_app/constans.dart';

import 'calorie_parameters.dart';

class calorieCalculatePage extends StatelessWidget {
  final CalorieParameters _calorieParameters;
  calorieCalculatePage(this._calorieParameters);
  double dailyCalorie;
  @override
  Widget build(BuildContext context) {
    calculate();
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Calculate Page'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Container(
            color: Colors.white10,
            child: Text(
              '${dailyCalorie.toStringAsFixed(2)} Calories You Need In A Day',
              style: kNumbersStyle,
            ),
          ),
        ),
      ),
    );
  }

  double calculate() {
    if (_calorieParameters.gender == 'man') {
      dailyCalorie = 66 +
          (9.6 * _calorieParameters.weight) +
          (1.7 * _calorieParameters.exercise) -
          (4.7 * _calorieParameters.fatRate);
    } else if (_calorieParameters.gender == 'women') {
      dailyCalorie = 665 +
          (9.6 * _calorieParameters.weight) +
          (1.7 * _calorieParameters.exercise) -
          (4.7 * _calorieParameters.fatRate);
    }
    return dailyCalorie;
  }
}
