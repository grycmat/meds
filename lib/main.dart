import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meds/pages/home.dart';

void main() {
  runApp(const Meds());
}

class Meds extends StatelessWidget {
  const Meds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const Home(),
    );
  }
}
