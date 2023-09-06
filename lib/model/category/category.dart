import 'package:hive/hive.dart';

import 'category_controller.dart';

part 'category.g.dart';

@HiveType(typeId: 2)
class Category extends HiveObject {

  @HiveField(0)
  late String tempId;

  @HiveField(1)
  String? realId;

  @HiveField(2)
  late String title;


  @HiveField(4)
  String? isSynced;

  @HiveField(12)
  String? lastUpdateDate;

  CategoryController get asController {
    return CategoryController.fromHive(
      this,
      tempId,
      title,
    );
  }

  @override
  Future<void> save() {
    lastUpdateDate = DateTime.now().toString();

    return super.save();
  }


}
