import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/home_page_view_model.dart';
import '../../settings/settings.dart';
import '../calander/calander.dart';
import '../todo/add_todo.dart';
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

  final HomePageViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          HomeBodyComponent(),
          CalendarPage(),
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
      floatingActionButton: AnimatedOpacity(
        curve: Curves.linearToEaseOut,
        duration: const Duration(milliseconds: 230),
        opacity: _currentIndex == 2 ? 0 : 1,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => Get.bottomSheet(
            BottomSheet(
              enableDrag: false,
              constraints: const BoxConstraints(
                maxHeight: 350,
                minHeight: 200,
              ),
              onClosing: () {},
              builder: (c) {
                return const AddTodoSheet();
              },
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}
