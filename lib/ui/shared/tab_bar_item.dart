import 'package:flutter/material.dart';

class TabBarItem {
  static BottomNavigationBarItem buildItem(String title, IconData iconName) {
    return BottomNavigationBarItem(
      icon: Icon(iconName),
      title: Text(title),
    );
  }
}
