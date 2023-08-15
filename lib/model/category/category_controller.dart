import '../../sync/usecases/category_sync.dart';

import 'category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  late Category hiveInstance;

  late Rx<String> tempId;
  late Rx<String> title;

  CategoryController({
    required this.tempId,
    required this.title,
  });

  CategoryController.fromHive(
    this.hiveInstance,
    String tempId,
    String title,
  ) {
    this.tempId = RxString(tempId);
    this.title = RxString(title);
  }

  void setTitle(String title) {
    this.title(title);

    CategorySyncHelper.updateContent(newContent: title, tempId: tempId.value);

    hiveInstance.title = title;
    hiveInstance.save();
  }
}
