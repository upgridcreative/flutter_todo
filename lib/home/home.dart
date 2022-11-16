import 'package:flutter/material.dart';
import 'package:flutter_todo/home/components/bottombar.dart';
import 'package:flutter_todo/theme/light.dart';

import 'components/body.dart';
import 'components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HomeComponent.getTab(text: "All", textColor: Colors.white, color: mainColor),actions: [HomeComponent.popUpButton()],),
      body: const HomeBodyComponent(),
      bottomNavigationBar: const HomeBottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
