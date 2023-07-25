import 'category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  late Category hiveInstance;

  late Rx<String> tempId;
  late Rx<String> title;
  late Rx<String> color;

  CategoryController({
    required this.tempId,
    required this.title,

    required this.color,
  });

  CategoryController.fromHive(
    this.hiveInstance,
    String tempId,
    String color,
    String title,
  ) {
    this.tempId = RxString(tempId);
    this.color = RxString(title);
    this.title = RxString(title);

  }

  void setTitle(String title) {
    this.title(title);

    hiveInstance.title = title;
    hiveInstance.save();
  }

  void setColor(String color) {
    this.color(color);

    hiveInstance.color = color;
    hiveInstance.save();
  }
}
