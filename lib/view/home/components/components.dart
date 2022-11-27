import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo/shared/theme/colors.dart';
import 'package:flutter_todo/shared/theme/light.dart';

import '../../../constants/decoration.dart';
import '../../../constants/lists.dart';

class HomeComponent {
  static Widget getTab(
      {required String text, required Color textColor, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: borderRadius, color: color),
      child: Text(
        text,
      ),
    );
  }

  static Widget popUpButton(List mypopUpList) {
    return PopupMenuButton(
      // color: ,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (context) => List.generate(mypopUpList.length, (index) {
        return PopupMenuItem<String>(
          child: Text(
            popUpList[index],
          ),
        );
      }),
    );
  }

  static Widget radioButtonActive() {
    return SvgPicture.asset(
      "assets/icons/done.svg",
      height: 25,
      width: 25,
    );
  }

  static Widget radioButtonInActive() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: mainColor)),
    );
  }

  static Widget divider() {
    return Divider(
      color: Colors.black,
      thickness: 1,
    );
  }
}
