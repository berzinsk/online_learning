import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../resources/constants/colors.dart';
import '../providers/app_state_provider.dart';
import '../screens/screens.dart';
import '../model/online_learning_pages.dart';

class BottomNavBar extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: OnlineLearningPages.home,
      key: ValueKey(OnlineLearningPages.home),
      child: BottomNavBar(
        currentTab: currentTab,
      ),
    );
  }

  final int currentTab;
  const BottomNavBar({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final pages = [
    const Home(),
    Courses(),
    const Search(),
    const Messages(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: IndexedStack(
            index: widget.currentTab,
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
              currentIndex: widget.currentTab,
              onTap: _onItemTapped,
              elevation: 0,
              showUnselectedLabels: true,
              selectedFontSize: 12,
              selectedItemColor: AppColors.kPrimaryBlue,
              selectedLabelStyle: GoogleFonts.poppins(),
              unselectedFontSize: 12,
              unselectedItemColor: AppColors.kShadow,
              unselectedLabelStyle: GoogleFonts.poppins(),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'asset/images/icon_nav_home.png',
                    color: widget.currentTab == 0
                        ? AppColors.kPrimaryBlue
                        : AppColors.kSecondaryGray,
                  ),
                  label: 'Home',
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'asset/images/icon_nav_course.png',
                    color: widget.currentTab == 1
                        ? AppColors.kPrimaryBlue
                        : AppColors.kSecondaryGray,
                  ),
                  label: 'Course',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'asset/images/icon_nav_search.png',
                    color: widget.currentTab == 2
                        ? AppColors.kPrimaryBlue
                        : AppColors.kSecondaryGray,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'asset/images/icon_nav_notification.png',
                    color: widget.currentTab == 3
                        ? AppColors.kPrimaryBlue
                        : AppColors.kSecondaryGray,
                  ),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'asset/images/icon_nav_account.png',
                    color: widget.currentTab == 4
                        ? AppColors.kPrimaryBlue
                        : AppColors.kSecondaryGray,
                  ),
                  label: 'Account',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    Provider.of<AppStateProvider>(context, listen: false).goToTab(index);
  }
}
