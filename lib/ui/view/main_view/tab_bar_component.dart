import 'package:final_1/ui/shared/tab_bar_item.dart';
import 'package:final_1/ui/view/view_component/first_main/tabs_first.dart';
import 'package:final_1/ui/view/view_component/four_tab.dart';
import 'package:final_1/ui/view/view_component/second_main/tab_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabBarComponent extends StatelessWidget {
  final List<BottomNavigationBarItem> _items = [
    TabBarItem.buildItem('Home', 'assets/icons/home.png'),
    TabBarItem.buildItem('Library', 'assets/icons/packs.png'),
    TabBarItem.buildItem('Cards', 'assets/icons/cards.png'),
  ];

  List<Widget> _tabs(BuildContext context) {
    return [
      FirstTab(),
      TabbedAppBarSample(),
      TagFour(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.black,
        inactiveColor: Colors.grey[500],
        items: _items,
      ),
      tabBuilder: (BuildContext context, int index) {
        final tabs = _tabs(context);
        return tabs[index];
      },
    );
  }
}
