import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/light.dart';

import '../../../../constants/decoration.dart';


class HomeComponent {
  static Widget getTab(
      {required String text, required Color textColor, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: borderRadius, color: color),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }

  static Widget popUpButton(List mypopUpList) {
    return PopupMenuButton(
      // color: ,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (context) => List.generate(mypopUpList.length, (index) {
        return PopupMenuItem<String>(
          child: Text(
            mypopUpList[index],
          ),
        );
      }),
    );
  }

  static Widget divider() {
    return const Divider(
      color: Colors.black,
      thickness: 1,
    );
  }

  static Widget verticalDivider() {
    return Text("|", style: noteTag);
  }
}
