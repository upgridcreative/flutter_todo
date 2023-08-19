import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/theme/light.dart';

List myBottomBar = ["home.svg", "schedule.svg", "setting.svg"];

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({Key? key, required this.onTap}) : super(key: key);
  final Function onTap;

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: mainColor,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
        widget.onTap(value);
      },
      items: List.generate(
        myBottomBar.length,
        (index) {
          return BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              "assets/icons/" + myBottomBar[index],
              color: currentIndex == index ? mainColor : Colors.black,
            ),
          );
        },
      ),
    );
  }
}
