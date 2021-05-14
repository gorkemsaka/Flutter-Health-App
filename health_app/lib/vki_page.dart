import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/constans.dart';
import 'package:health_app/vki_parameters.dart';

import 'vki_calculate_page.dart';

class vkiPage extends StatefulWidget {
  @override
  _vkiPageState createState() => _vkiPageState();
}

class _vkiPageState extends State<vkiPage> {
  double weight = 20, height = 172;
  List<String> manSelect = ['man', 'manSelected'];
  List<String> womenSelected = ['women', 'womenSelected'];
  String gender;
  int manIndex = 0;
  int womenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'VKI Calculator',
          style: kWordsStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'man';

                      setState(() {
                        if (gender == 'man') {
                          manIndex = 1;
                          womenIndex = 0;
                        }
                      });
                    },
                    child:
                        Image.asset('assets/images/${manSelect[manIndex]}.png'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'woman';
                      setState(() {
                        if (gender == 'woman') {
                          womenIndex = 1;
                          manIndex = 0;
                        }
                      });
                    },
                    child: Image.asset(
                        'assets/images/${womenSelected[womenIndex]}.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  (weight.toInt()).toString(),
                  style: kNumbersStyle,
                ),
                Slider(
                  min: 0,
                  max: 200,
                  label: weight.toString(),
                  value: weight,
                  onChanged: (newValue) {
                    setState(() {
                      weight = newValue;
                    });
                  },
                ),
                Text(
                  'Enter Your Weight (KG)',
                  style: kWordsStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  (height.toInt()).toString(),
                  style: kNumbersStyle,
                ),
                Slider(
                  min: 150,
                  max: 200,
                  value: height,
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue;
                    });
                  },
                ),
                Text(
                  'Enter Your Height (CM)',
                  style: kWordsStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => calculatePage(
                          VkiParameters(
                              weight: weight, height: height, gender: gender),
                        ),
                      ),
                    );
                  },
                  child: Text('Calculate!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
