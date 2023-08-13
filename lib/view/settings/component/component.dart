import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/decoration.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/light.dart';

class SettingsComponent {
  static Widget settingTile(
      {required String title, required IconData? icon, required Function onTap,required bool isForward,required Color color}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: ColorClass.grey,
      ),
      height: 83,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Row(children: [
        if(icon!=null)   Icon(
            icon,
            color: color,
          )else SizedBox(width: 24,),
          const SizedBox(width: 10),
          Text(
            title,
            style: listTileTitle.copyWith(color: color),
          ),
          const Spacer(),
        if(isForward)  SvgPicture.asset(
            "assets/icons/forward.svg",
            color: mainColor,
          ),
        ]),
      ),
    );
  }
}
