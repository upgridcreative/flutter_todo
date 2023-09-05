import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:get/get.dart";

import '../../../../view_model/task_view_model.dart';

class CategoryDropDownButton extends StatelessWidget {
  CategoryDropDownButton({Key? key}) : super(key: key);

  final TaskViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
        items: viewModel.categories.map(
          (element) {
            return DropdownMenuItem(
              value: element.tempId.value,
              child: Text(element.title.value),
            );
          },
        ).toList(),
        elevation: 0,
        icon: const SizedBox(),
        underline: const SizedBox(),
        value: viewModel.task.categoryTempId.value,
        onChanged: (tempId) {
          viewModel.task.setCategory(tempId as String);
        },
        hint: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.secondary.withOpacity(.7),
          ),
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Text(
              'No Category',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        alignment: Alignment.centerLeft,
        selectedItemBuilder: (c) => viewModel.categories
            .map(
              (element) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary.withOpacity(.7),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    viewModel.task.category.toString(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
