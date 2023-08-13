import '../sync/usecases/category_sync.dart';

import '../model/category/category.dart';
import '../model/category/category_controller.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CategoryRepository extends GetxController {
  final box = Hive.box<Category>('categories');

  late final RxList<CategoryController> _categories;

  static final CategoryRepository instance = Get.find();

  CategoryRepository() {
    final storedCategories = box.values;
    _categories = RxList(); //Init the variable first

    for (var element in storedCategories) {
      //Convert to `CategoryControllers` and add to `_categories`
      _categories.add(element.asController);
    }
  }

  void refreshFromDB() {
    final storedTasks = box.values;

    for (var element in storedTasks) {
      _categories.addIf(
        _categories.where((p0) => p0.tempId.value == element.tempId).isEmpty,
        element.asController,
      );
    }

    update();
  }

  RxList<CategoryController> get categories => _categories;

  void addCategoryFromValues(String title, String color) {
    final object = Category()
      ..tempId = DateTime.now().toString()
      ..title = title;

    addCategory(object);
  }

  void addCategory(Category category) {
    box.put(category.tempId, category);

    CategorySyncHelper.addCategory(
      content: category.title,
      tempId: category.tempId,
    );

    _categories.add(category.asController);
  }

  void deleteCategory(CategoryController category) {
    box.delete(category.tempId.value);

    _categories.remove(category);

    CategorySyncHelper.delete(
      tempId: category.tempId.value,
    );
  }

  bool hasCategoryWithTitle(String title) {
    return _categories.where((p0) => p0.title.value == title).isNotEmpty;
  }

  CategoryController getCategoryByName(String name) {
    return _categories.where((p0) => p0.title.value == name).first;
  }

  CategoryController getCategoryByTempId(String id) {
    return _categories.where((p0) => p0.tempId.value == id).first;
  }

  bool hasCategoryWithTempId(String tempId) {
    return _categories.where((p0) => p0.tempId.value == tempId).isNotEmpty;
  }

  Category getHiveCategoryByTempId(String id) {
    return box.values.where((p0) => p0.tempId == id).first;
  }

  bool hasHiveCategoryWithTempId(String tempId) {
    return box.values.where((p0) => p0.tempId == tempId).isNotEmpty;
  }

  Future<void> onLogout() async {
    await box.clear();
    categories.clear();
  }
}
