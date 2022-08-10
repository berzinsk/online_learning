import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/constants/colors.dart';

import '../screens/home.dart';
import '../screens/courses.dart';
import '../screens/search.dart';
import '../screens/messages.dart';
import '../screens/account.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final pages = [
    const Home(),
    const Courses(),
    const Search(),
    const Messages(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          selectedItemColor: AppColors.kPrimaryBlue,
          selectedLabelStyle: GoogleFonts.poppins(),
          unselectedFontSize: 12,
          unselectedItemColor: AppColors.kMenuGray,
          unselectedLabelStyle: GoogleFonts.poppins(),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('asset/images/icon_nav_home.png'),
              label: 'Home',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('asset/images/icon_nav_course.png'),
              label: 'Course',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('asset/images/icon_nav_search.png'),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('asset/images/icon_nav_notification.png'),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('asset/images/icon_nav_account.png'),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
