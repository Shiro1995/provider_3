import 'package:flutter/material.dart';

class TabBarItem {
  static BottomNavigationBarItem buildItem(String title, String imageName) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(imageName),
        size: 25.0,
      ),
      title: Text(title),
    );
  }
}
