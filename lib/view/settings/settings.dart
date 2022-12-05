import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/constants/lists.dart';
import 'package:flutter_todo/shared/components/appbar.dart';
import 'package:flutter_todo/shared/theme/light.dart';
import 'package:flutter_todo/view/settings/component/component.dart';
import 'package:flutter_todo/view/settings/privacy_account.dart';

import '../../animations/page_transition.dart';
import '../../constants/decoration.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         MyAppBar(title: "Settings"),  
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: settingsList.length,
              itemBuilder: (BuildContext context, int index) {
                return SettingsComponent.settingTile( color:mainColor,
                  isForward: true,
                    title: settingsList[index]["title"],
                    icon: settingsList[index]["icon"],
                    onTap: () {
                      // Get.to(page)
                      Navigator.of(context).push(
                        PageTransition(
                          child: const PrivacySettings(),
                          type: PageTransitionType.fromRight,
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
