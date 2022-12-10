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
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: borderRadius, color: color),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }

  static Widget popUpButton(List myList) {
    return PopupMenuButton(
      // color: ,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (context) => List.generate(myList.length, (index) {
        return PopupMenuItem<String>(
          child: Text(
            myList[index],
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
    return  Text("|",style:noteTag);
  }


}
