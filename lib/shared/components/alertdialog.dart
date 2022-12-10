import 'package:flutter/material.dart';

import '../../constants/decoration.dart';
import '../theme/colors.dart';
import 'custom_short_button.dart';

class AlertDialogFunction {
 static showDialogBox(
      {required BuildContext context,
      required String title,
      required Widget? content,
      required String buttonName}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorClass.grey,
          actionsPadding: const EdgeInsets.only(right: 12),
          title: Text(title),
          content: content,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: subTitle.copyWith(
                      color: ColorClass.black70,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomShortButton(
                  title: buttonName,
                  heightFactor: 0.25,
                  customTextStyle: subTitle.copyWith(color: Colors.white),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
