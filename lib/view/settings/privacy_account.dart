import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/constants/decoration.dart';
import 'package:flutter_todo/constants/lists.dart';
import 'package:flutter_todo/shared/components/appbar.dart';
import 'package:flutter_todo/shared/theme/light.dart';
import 'package:flutter_todo/view/settings/component/component.dart';

class PrivacySettings extends StatelessWidget {
  const PrivacySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(title:settingsList[0]["title"],),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: privacyList.length,
              itemBuilder: (BuildContext context, int index) {
                return SettingsComponent.settingTile(
                  color:index==0? mainColor:redcolor,
                  isForward: false,
                    title: privacyList[index]["title"],
                    icon: privacyList[index]["icon"],
                    onTap: () {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
