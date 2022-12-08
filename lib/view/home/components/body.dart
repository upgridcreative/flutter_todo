import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/constants/lists.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          const SizedBox(height: 15),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: size.width * 0.95,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: catagories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CatagorySwitch(
                          title: catagories[index],
                          isActive: index == 0,
                        );
                      },
                    ),
                  ),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Today, ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF80B231),
                  ),
                ),
                TextSpan(
                  text: '6 December',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black,
                ),
                itemCount: taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodoTile(
                    index: index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatagorySwitch extends StatelessWidget {
  final String title;
  final bool isActive;

  const CatagorySwitch({Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF484B6A) : const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class TodoTile extends StatelessWidget {
  const TodoTile({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: !taskList[index]["completed"]
                ? Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: mainColor,
                      ),
                    ),
                  )
                : Container(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      "assets/icons/done.svg",
                      height: 25,
                      width: 25,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 10,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskList[index]["title"],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: -.01,
                      fontSize: 13.5.sp,
                      color: taskList[index]["completed"]
                          ? Colors.black.withOpacity(.6)
                          : Colors.black,
                      decoration: taskList[index]["completed"]
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  if (taskList[index]["due"].isNotEmpty ||
                      taskList[index]["category"].isNotEmpty ||
                      taskList[index]["subTasks"] != 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/calender.svg",
                                color: taskList[index]["isDue"]
                                    ? Colors.red
                                    : mainColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                taskList[index]["due"],
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: taskList[index]["isDue"]
                                      ? Colors.red
                                      : mainColor,
                                ),
                              )
                            ],
                          ),
                          if (taskList[index]["due"].isNotEmpty &&
                              (taskList[index]["category"].isNotEmpty ||
                                  taskList[index]["subTasks"] != 0))
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                              ),
                              child: HomeComponent.verticalDivider(),
                            ),
                          if (taskList[index]["category"].isNotEmpty)
                            Text(
                              taskList[index]["category"],
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue,
                              ),
                            ),
                          if (taskList[index]["subTasks"] > 0 &&
                              (taskList[index]["due"].isNotEmpty ||
                                  taskList[index]["category"].isNotEmpty))
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                              ),
                              child: HomeComponent.verticalDivider(),
                            ),
                          if (taskList[index]["subTasks"] > 0)
                            Row(
                              children: [
                                Text(
                                  '${taskList[index]["subTasksCompleted"]}/${taskList[index]["subTasks"]}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFCE736E),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.merge,
                                  size: 11,
                                  color: Color(0xFFCE736E),
                                ),
                              ],
                            ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
