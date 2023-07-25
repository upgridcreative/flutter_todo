import 'category_controller.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 2)
class Category extends HiveObject {
  @HiveField(0)
  late String tempId;

  @HiveField(1)
  String? realId;

  @HiveField(2)
  late String title;

  @HiveField(3)
  late String color;

  @HiveField(4)
  String? isSynced;

  CategoryController get asController {
    return CategoryController.fromHive(
      this,
      tempId,
      color,
      title,
    );
  }
}
