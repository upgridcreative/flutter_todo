import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/lists.dart';
import 'package:flutter_todo/home/components/bottombar.dart';
import 'package:flutter_todo/manage_categories/components/categorieslist.dart';
import 'package:flutter_todo/theme/light.dart';

import '../animations/page_transition.dart';
import '../manage_categories/manage_categories.dart';
import 'components/body.dart';
import 'components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeComponent.getTab(
            text: "All", textColor: Colors.white, color: mainColor),
        actions: [
          HomeComponent.popUpButton(popUpList),
        ],
      ),
      body: const HomeBodyComponent(),
      bottomNavigationBar: const HomeBottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.of(context).push(
            PageTransition(
              child: const ManageCategories(),
              type: PageTransitionType.fromRight,
            ),
          );
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
