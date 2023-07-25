import '../model/category/category.dart';
import '../model/category/category_controller.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CategoryRepository extends GetxController {
  final box = Hive.box<Category>('categories');

  late final RxList<CategoryController> _categories;

  CategoryRepository() {
    final storedCategories = box.values;
    _categories = RxList(); //Init the varaible first

    for (var element in storedCategories) {
      //Convert to `CategoryControllers` and add to `_categories`
      _categories.add(element.asController);
    }
  }

  RxList<CategoryController> get categories => _categories;

  void addCategoryFromValues(String title, String color) {
    final object = Category()
      ..tempId = DateTime.now().toString()
      ..title = title
      ..color = color;

    addCategory(object);
  }

  void addCategory(Category category) {
    box.put(category.tempId, category);

    _categories.add(category.asController);
  }

  void deleteCategory(CategoryController category) {
    //! When sync is implemented , find a better way to delete in order to maintain sync status properly
    box.delete(category.tempId.value);
    
    _categories.remove(category);
  }

  void editTitle(CategoryController instance, String title) =>
      instance.setTitle(title);

  void editColor(CategoryController instance, String color) =>
      instance.setColor(color);



  bool hasCategoryWithTitle(String title) {
    return _categories.where((p0) => p0.title.value == title).isNotEmpty;
  }

  CategoryController getCategoryByName(String name) {
    return _categories.where((p0) => p0.title.value == name).first;
  }
   CategoryController getCategoryByTempId(String id) {
    return _categories.where((p0) => p0.tempId.value == id).first;
  }
}
