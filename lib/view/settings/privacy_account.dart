import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/constants/lists.dart';
import 'package:flutter_todo/view/settings/component/component.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: settingsList.length,
        itemBuilder: (BuildContext context, int index) {
          return SettingsComponent.settingTile(
              title: settingsList[index]["title"],
              icon: settingsList[index]["icon"],
              onTap: () {});
        },
      ),
    );
  }
}
