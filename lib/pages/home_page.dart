import 'package:annepedia/bottom_navi/my_custom_nottom_navi.dart';
import 'package:annepedia/bottom_navi/tab_items.dart';
import 'package:annepedia/models/user.dart';
import 'package:annepedia/pages/calender_page.dart';
import 'package:annepedia/pages/flow_page.dart';
import 'package:annepedia/pages/profile_page.dart';
import 'package:annepedia/pages/questions_page.dart';
import 'package:annepedia/pages/search_page.dart';
import 'package:annepedia/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final Users user;

  HomePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItems _currentTab = TabItems.Home;

  Map<TabItems, Widget> tumSayfalar() {
    return {
      TabItems.Home: FlowPage(),
      TabItems.Search: SearchPage(),
      TabItems.Questions: QuestionsPage(),
      TabItems.Calender: CalendarPage(),
      TabItems.Profile: ProfilePage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return Container(
      child: MyCustomNavi(
          sayfaOlustur: tumSayfalar(),
          currentTab: _currentTab,
          onSelectedTab: (secilenTab) {
            setState(() {
              _currentTab = secilenTab;
            });
            print("Seçilen tab : " + secilenTab.toString());
          }),
    );
  }
}
