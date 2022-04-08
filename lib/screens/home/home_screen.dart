import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talent_bank/screens/bank_management/bank_main_screen.dart';
import 'package:talent_bank/screens/student_management/student_main_screen.dart';
import 'package:talent_bank/screens/talent_management/talent_main_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 1;
  bool firebaseInitialized = false;
  PageController pageController= PageController();

  @override
  Widget build(BuildContext context) {

    void navigationTapped(int page) {
      pageController.jumpToPage(page);
    }

    void onPageChanged(int page) {
      setState(() {
        this.page = page;
      });
    }

    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Colors.white,
            child: const StudentMainScreen(),
          ),
          Container(
            color: Colors.white,
            child: const BankMainScreen(),
          ),
          Container(
            color: Colors.white,
            child: const TalentMainScreen(),
          ),
        ],
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face_outlined,
              color: (page == 0) ? Colors.black : Colors.grey,
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: (page == 1) ? Colors.black : Colors.grey,
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on_outlined,
              color: (page == 2) ? Colors.black : Colors.grey,
            ),
            backgroundColor: Colors.white,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: page,
      ),
    );

  }
}