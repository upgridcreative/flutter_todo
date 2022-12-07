import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/constants/decoration.dart';
import 'package:flutter_todo/constants/lists.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/theme/light.dart';
import 'components.dart';

class HomeBodyComponent extends StatelessWidget {
  const HomeBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 65,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                      width: size.width * 0.9,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: popUpList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HomeComponent.getTab(
                              text: popUpList[index],
                              textColor: index == 0 ? Colors.white : Colors.black,
                              color: index == 0 ? mainColor : ColorClass.grey);
                        },
                      )),
                ),
                Icon(Icons.more_vert),
              ],
            ),
      
          ),

          Text("Today", style: largeTitle),
          Expanded(
            child: ListView.separated(
              itemCount: taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    taskList[index]["active"]
                        ? HomeComponent.radioButtonInActive()
                        : HomeComponent.radioButtonActive(),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          taskList[index]["title"],
                          style: noteTitle.copyWith(
                              decoration: taskList[index]["completed"]
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HomeComponent.clockTitle(
                                  title: taskList[index]["time"],
                                  color: mainColor,
                                  image: "calender.svg"),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                child: HomeComponent.verticalDivider(),
                              ),
                              if (taskList[index]["category"]
                                  .toString()
                                  .isNotEmpty)
                                Text(
                                  taskList[index]["category"],
                                  style: noteTag,
                                )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return HomeComponent.divider();
              },
            ),
          ),

          // HomeComponent.radioButtonInActive(),
          // HomeComponent.divider(),
          // Text(
          //   "Help Lakshya with Help4You",
          //   style: noteTitle,
          // ),
          // Text(
          //   "Help Lakshya with Help4You",
          //   style: noteTitle.copyWith(decoration: TextDecoration.lineThrough),
          // ),
          // HomeComponent.verticalDivider(),
          // Text(
          //   "Help Lakshya with Help4You",
          //   style: noteTag,
          // ),
        ],
      ),
    );
  }
}
