import 'package:flutter/material.dart';
import 'package:talent_bank/routes.dart';
import 'package:talent_bank/theme.dart';

//
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '달란트 통장',
      theme: theme(),
      routes: routes,
      initialRoute: '/home',
    );
  }
}
