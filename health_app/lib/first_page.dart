import 'package:flutter/material.dart';
import 'package:health_app/constans.dart';
import 'package:health_app/vki_page.dart';

import 'calorie_page.dart';

class firstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health App',
          style: kWordsStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/healtIcon.jpg'),
              radius: 200,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Welcome To Health App!',
              style: kWordsStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => vkiPage()));
                    },
                    child: Text(
                      'Calculate VKI!',
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CaloriePage()));
                    },
                    child: Text(
                      'Calculate Daily Calorie!',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
