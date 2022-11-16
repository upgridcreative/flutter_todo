import 'package:flutter/material.dart';

import '../../constants/decoration.dart';
import '../../constants/lists.dart';

class HomeComponent {
  static Widget getTab(
      {required String text, required Color textColor, required Color color}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: borderRadius, color: color),
      child: Text(
        text,
      ),
    );
  }

  static Widget popUpButton() {
    return PopupMenuButton(
      // color: ,
      shape:RoundedRectangleBorder(borderRadius: borderRadius) ,
      icon: const Icon(Icons.filter_alt),
      itemBuilder: (context) => List.generate(popUpList.length,(index){
        return PopupMenuItem<String>(
          child: Text(
            popUpList[index],
          ),
        );
      }),
    );
  }
}
