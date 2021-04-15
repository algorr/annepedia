import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItems {Home, Search, Questions, Calender, Profile}

class TabItemData{
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItems, TabItemData> tumTablar = {
    TabItems.Home : TabItemData("HomePage", Icons.home_rounded),
    TabItems.Search : TabItemData("Search", Icons.search_rounded),
    TabItems.Questions : TabItemData("Questions", Icons.question_answer_rounded),
    TabItems.Calender : TabItemData("Calender", Icons.calendar_today_rounded),
    TabItems.Profile : TabItemData("Profile", Icons.person),
  };

}