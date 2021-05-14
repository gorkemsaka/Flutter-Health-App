import 'package:flutter/material.dart';
import 'package:health_app/constans.dart';
import 'package:health_app/vki_parameters.dart';

class calculatePage extends StatelessWidget {
  final VkiParameters _vkiParameters;
  calculatePage(this._vkiParameters);
  double vkiResult;
  String idealWeight;

  @override
  Widget build(BuildContext context) {
    vkiResult = _vkiParameters.weight /
        (_vkiParameters.height / 100 * _vkiParameters.height / 100);
    calculate(vkiResult);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "VKI Results",
          style: kWordsStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Container(
            color: Colors.white10,
            child: Text(
              idealWeight,
              style: kNumbersStyle,
            ),
          ),
        ),
      ),
    );
  }

  String calculate(vkiResult) {
    if (vkiResult < 18.49) {
      idealWeight = 'You Weight Is Below Ideal Weight!';
    } else if (vkiResult > 18.8 && vkiResult < 24.9) {
      idealWeight = 'Your Weight Is Ideal!';
    } else if (vkiResult > 25 && vkiResult < 29.99) {
      idealWeight = 'Your Weight Is Above Ideal Weight!';
    } else if (vkiResult > 30) {
      idealWeight = 'Your Weight Is Much Above Your Ideal Weight';
    }

    return idealWeight;
  }
}
