import 'package:flutter_todo/model/category/category_controller.dart';
import 'package:flutter_todo/model/task/task_controller.dart';
import 'package:flutter_todo/repository/category.dart';
import 'package:flutter_todo/repository/task.dart';
import 'package:flutter_todo/view_model/home_page.dart';

import 'package:get/get.dart';

class CategoryPageViewModel extends GetxController {
  static CategoryPageViewModel get instance => Get.find();

  final CategoryRepository _categoryRepository = Get.find();
  final TaskRepository _taskRepository = Get.find();
  final HomePageViewModel _homePageViewModel = Get.find();
  late final TaskController _taskController;

  void initTaskController() {
    _taskController = Get.find();
  }

  RxList<CategoryController> get categories => _categoryRepository.categories;

  void addCategory(String title, {String color = 'DCEDC1'}) {
    if (_categoryRepository.hasCategoryWithTitle(title)) {
      //Todo: Show the error in the frontend
      return;
    }
    _categoryRepository.addCategoryFromValues(title, color);
  }

  void deleteCategory(CategoryController category) {
    _categoryRepository.deleteCategory(category);
    _taskRepository.onCategoryDeleted(category);

    if (_homePageViewModel.currentTab.value == category.title.value) {
      _homePageViewModel.currentTab('All');
      //Todo: Move logic to homePageViewModel
    }
  }

  void updateCategory(
      String? title, String? color, CategoryController instance) {
    if (_categoryRepository.hasCategoryWithTitle(title ?? '')) {
      //Todo: Show the error in the frontend
      return;
    }
    //Todo: Improve the way updation happenes
    _categoryRepository.editTitle(instance, title ?? instance.title.value);
    _categoryRepository.editColor(instance, color ?? instance.color.value);
  }

  int getTaskCountOf(CategoryController category) {
    return _taskRepository.getTasksByCategory(category).length;
  }
}
