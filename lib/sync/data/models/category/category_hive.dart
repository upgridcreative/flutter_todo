import 'package:hive/hive.dart';

part 'category_hive.g.dart';

@HiveType(typeId: 11)
class SyncCategory extends HiveObject {
  @HiveField(0)
  late String tempId;

  @HiveField(1)
  late String? title;

    @HiveField(2)
  late String actionType;


  @HiveField(3) 
  String? creationDateTime;

  @HiveField(9)
  late String uuid;

  bool isUUIDSet() {
    try {
      uuid.length;

      return true;
    } catch (e) {
      return false;
    }
  }

  bool isActionTypeSet() {
    try {
      actionType.length;

      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String,String> toJson() {
    return {
      'title': title!,
      'catagory_id':tempId,
    };
  }
}
