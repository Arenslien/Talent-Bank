import 'package:flutter/material.dart';
import 'package:talent_bank/screens/bank_management/bank_main_screen.dart';
import 'package:talent_bank/screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  BankMainScreen.routeName : (context) => const BankMainScreen(),
  HomeScreen.routeName : (context) => const HomeScreen(),
};
