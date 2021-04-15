import 'package:annepedia/bottom_navi/tab_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomNavi extends StatelessWidget {
  final TabItems currentTab;
  final ValueChanged<TabItems> onSelectedTab;
  final Map<TabItems, Widget> sayfaOlustur;

  const MyCustomNavi(
      {Key key,
      @required this.currentTab,
      @required this.onSelectedTab,
      @required this.sayfaOlustur})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(border: Border(),
        activeColor: Colors.deepPurple,
        items: [
          _navItemOlustur(TabItems.Home),
          _navItemOlustur(TabItems.Search),
          _navItemOlustur(TabItems.Questions),
          _navItemOlustur(TabItems.Calender),
          _navItemOlustur(TabItems.Profile),
        ],
        onTap: (index) => onSelectedTab(TabItems.values[index]),
      ),
      tabBuilder: (context, index) {
        final gosterilecekItem = TabItems.values[index];
        return sayfaOlustur[gosterilecekItem];
      },
    );
  }

  BottomNavigationBarItem _navItemOlustur(TabItems tabItem) {
    final olusturulacakTab = TabItemData.tumTablar[tabItem];
    return BottomNavigationBarItem(
        icon: Icon(olusturulacakTab.icon), label: olusturulacakTab.title);
  }
}
