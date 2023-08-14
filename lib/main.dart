import 'package:flutter/material.dart';

import 'school_list.dart';

void main() {
  runApp(const MySchools());
}

class MySchools extends StatelessWidget {
  const MySchools({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SekolahQu',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SchoolList();
  }
}
