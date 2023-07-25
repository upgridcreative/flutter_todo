import 'package:flutter/material.dart';
import '../../todo/todo_detail.dart';

import '../../../shared/components/todo_tile.dart';
import '../../manage_categories/manage_categories.dart';
import '../../../view_model/home_page.dart';
import 'package:get/get.dart';

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
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () => Get.to(() => const ManageCategories()),
                  ),
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
      ),
    );
  }
}
