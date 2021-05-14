import 'package:flutter/material.dart';

import 'first_page.dart';

main() {
  runApp(healthApp());
}

class healthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: firstPage(),
    );
  }
}
