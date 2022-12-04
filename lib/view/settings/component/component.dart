import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/shared/theme/colors.dart';
import 'package:flutter_todo/shared/theme/light.dart';

import '../../../constants/decoration.dart';

class SettingsComponent {
  static Widget settingTile(
      {required String title, required String icon, required Function onTap}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: ColorClass.grey,
      ),
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.all(8),
      child: Row(children: [
        const Icon(Icons.person,color: mainColor,),
        const SizedBox(width: 10),
        Text(
          title,
          style: listTileTitle,
        ),
        const Spacer(),
        SvgPicture.asset(
          "assets/icons/forward.svg",
          color: mainColor,
        ),
      ]),
    );
  }
}
