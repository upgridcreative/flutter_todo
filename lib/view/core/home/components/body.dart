import 'package:flutter/material.dart';
import 'package:flutter_todo/shared/theme/colors.dart';
import 'package:get/get.dart';

import '../../../../view_model/home_page.dart';
import '../../categories/manage_categories.dart';
import '../../todo/todo_detail.dart';
import '../../todo/todo_tile.dart';

class HomeBodyComponent extends StatelessWidget {
  HomeBodyComponent({Key? key}) : super(key: key);
  final HomePageViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => Column(
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
                        itemCount: controller.getTabs().length,
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(
                            () => CatagorySwitch(
                              title: controller.getTabs()[index],
                              isActive: controller.getTabs()[index] ==
                                  controller.currentTab.value,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () async {
                          await Future.delayed(
                            const Duration(microseconds: 100),
                          );
                          Get.to(() => const ManageCategories());
                        },
                        value: 1,
                        child: Row(
                          children: [
                            Text(
                              "Manage Categories",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.color,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                    offset: const Offset(0, 20),
                    color: Theme.of(context).cardColor,
                    child: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Today, ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  TextSpan(
                    text: controller.dateToday,
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).textTheme.displayMedium?.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Container(
                decoration: const BoxDecoration(),
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    width: double.infinity,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
                  itemCount: controller.getTasks().length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => TodoDetailPage(
                            task: controller.getTasks()[index],
                          ),
                        );
                      },
                      child: TodoTile(
                        task: controller.getTasks()[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CatagorySwitch extends StatelessWidget {
  final String title;
  final bool isActive;

  final HomePageViewModel controller = Get.find();

  CatagorySwitch({Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.setTab(title),
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: isActive ? ColorClass.primary : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isActive
                ? Colors.white
                : Theme.of(context).textTheme.displaySmall?.color,
          ),
        ),
      ),
    );
  }
}
