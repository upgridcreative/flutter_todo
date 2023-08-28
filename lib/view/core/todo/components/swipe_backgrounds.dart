
import 'package:flutter/material.dart';

import '../../../../view_model/settings_page_view_model.dart';
import '../utils/getWidget.dart';

class RightBackGround extends StatelessWidget {
  const RightBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 15),
            Icon(
              getIconForSwipeAction(
                  SettingPageViewModel.instance.swipeRightAction.value),
              color: getColorForSwipeAction(
                SettingPageViewModel.instance.swipeRightAction.value,
              ),
            ),
            Text(
              SettingPageViewModel.instance.getCurrentRightSwipeAction().value,
              style: TextStyle(
                color: getColorForSwipeAction(
                  SettingPageViewModel.instance.swipeRightAction.value,
                ),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class LeftBackGround extends StatelessWidget {
  const LeftBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.centerRight,
        child: SettingPageViewModel.instance.hasSwipeLeft.value
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    getIconForSwipeAction(
                        SettingPageViewModel.instance.swipeLeftAction.value),
                    color: getColorForSwipeAction(
                      SettingPageViewModel.instance.swipeLeftAction.value,
                    ),
                  ),
                  Text(
                    SettingPageViewModel.instance
                        .getCurrentRightSwipeAction()
                        .value,
                    style: TextStyle(
                      color: getColorForSwipeAction(
                        SettingPageViewModel.instance.swipeLeftAction.value,
                      ),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(width: 30),
                ],
              )
            : Row(
                children: [],
              ),
      ),
    );
  }
}
