// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:practice_8_9/navigation_bar/profile/ui/page/profile_page.dart';
import 'package:practice_8_9/navigation_bar/qr/qrscan.dart';

import 'animation/animation_page.dart';
import 'news/ui/home.dart';

class NavigationnBar extends StatefulWidget {
  const NavigationnBar({Key? key}) : super(key: key);

  @override
  State<NavigationnBar> createState() => _NavigationnBarState();
}

class _NavigationnBarState extends State<NavigationnBar> {
  int _currentIndex = 0;
  final ttabs = [
    ExampleListPage(),
    QrPage(),
    AnimationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ttabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Добавьте дополнительные действия при смене вкладки
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QrScannPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper,
              ),
              label: "News",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2),
            label: "QR scanner",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation),
            label: "Animation",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
