import 'package:flutter/material.dart';
import 'package:flutter_todo/view/calendar/calender.dart';
import 'package:flutter_todo/view/settings/settings.dart';

import '../../animations/page_transition.dart';
import '../../shared/theme/light.dart';
import '../manage_categories/manage_categories.dart';
import 'components/body.dart';
import 'components/bottombar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
    final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: HomeComponent.getTab(
      //       text: "All", textColor: Colors.white, color: mainColor),
        
      // ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          HomeBodyComponent(),
          SettingsScreen(),
          CalenderScreen(),
          SettingsScreen()
        ],
      ),
      bottomNavigationBar: HomeBottomBar(
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
          _pageController.jumpToPage(val);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.of(context).push(PageTransition(
            child: const ManageCategories(),
            type: PageTransitionType.fromRight,
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
