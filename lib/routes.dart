import 'package:flutter/material.dart';
import 'package:talent_bank/screens/bank_management/bank_main_screen.dart';
import 'package:talent_bank/screens/home/home_screen.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:talent_bank/screens/authentication/find_id_screen.dart';
import 'package:talent_bank/screens/authentication/find_password_screen.dart';
import 'package:talent_bank/screens/authentication/start_screen.dart';
import 'package:talent_bank/screens/authentication/login_screen.dart';
import 'package:talent_bank/screens/authentication/register_page.dart';

final Map<String, WidgetBuilder> routes = {
  BankMainScreen.routeName: (context) => const BankMainScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  StartScreen.routeName: (context) => const StartScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  FindIdScreen.routeName: (context) => const FindIdScreen(),
  FindPasswordScreen.routeName: (context) => const FindPasswordScreen(),
};
