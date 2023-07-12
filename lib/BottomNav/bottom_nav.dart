import 'package:flutter/material.dart';
import 'package:list_movie/home/donwload.dart';
import 'package:list_movie/home/youtube.dart';
import 'package:list_movie/theme.dart';

import '../home/home_screen.dart';
import '../home/settings.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final _screens = [
    const HomeScreen(),
    YoutubeScreen(),
    Downloads(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 13, 12, 12),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              child: Image.asset(
                "assets/icons/home.jpg",
                color: _selectedIndex == 0 ? blueColor : whiteColor,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Image.asset(
                "assets/icons/youtube.png",
                color: _selectedIndex == 1 ? blueColor : whiteColor,
              ),
            ),
            label: "Youtube",
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Image.asset(
                "assets/icons/donwload.png",
                color: _selectedIndex == 2 ? blueColor : whiteColor,
              ),
              height: 40,
            ),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Image.asset(
                "assets/icons/settings.png",
                color: _selectedIndex == 3 ? blueColor : whiteColor,
              ),
            ),
            label: "User",
          ),
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
    );
  }
}
