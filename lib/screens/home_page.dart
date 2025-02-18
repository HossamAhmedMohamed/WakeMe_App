// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:alarm_app/screens/alarm_page.dart';
import 'package:alarm_app/screens/clock_page.dart';
import 'package:alarm_app/screens/stop_watch_page.dart';
import 'package:alarm_app/screens/timer_page.dart';
import 'package:alarm_app/utils/colors.dart';
import 'package:alarm_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ClockPage(),
    AlarmPage(),
    StopWatchPage(),
    TimerPage()
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
          _selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            body: _screens[_selectedIndex],
            backgroundColor: CustomColors.pageBackgroundColor,
            bottomNavigationBar: CustomBottomNavigationBar(
              selectedIndex: _selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            )),
      ),
    );
  }
}
