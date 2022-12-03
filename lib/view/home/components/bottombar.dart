import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../shared/theme/light.dart';

List myBottomBar = ["home.svg", "schedule.svg", "refresh.svg", "setting.svg"];

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

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
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: List.generate(myBottomBar.length, (index) {
          print("assets/icons/" + myBottomBar[index]);
          return BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                "assets/icons/" + myBottomBar[index],
                color: currentIndex==index?mainColor:Colors.black,
              ));
        }));
  }
}
