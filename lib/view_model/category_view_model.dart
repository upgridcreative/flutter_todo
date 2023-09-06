import 'package:get/get.dart';

import '../model/category/category_controller.dart';
import '../model/task/task_controller.dart';
import '../repository/category.dart';
import '../repository/task.dart';
import 'home_page_view_model.dart';

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

  void updateCategory(String? title, CategoryController instance) {
    if (_categoryRepository.hasCategoryWithTitle(title ?? '')) {
      return;
    }
    instance.setTitle(title ?? instance.title.value);
    _homePageViewModel.setTab(title!);
  }

  int getTaskCountOf(CategoryController category) {
    return _taskRepository.getAllTasks
        .where((p0) => p0.categoryTempId.value == category.tempId.value)
        .length;
  }
}
