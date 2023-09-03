import '../models/task/task_hive.dart';
import '../models/category/category_hive.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SyncLocalDataSource extends GetxController {
  final syncTaskBox = Hive.box<SyncTask>('sync_tasks');
  final syncCategoryBox = Hive.box<SyncCategory>('sync_categories');

  static final SyncLocalDataSource instance = Get.find();

  void addTask(SyncTask task) {
    final uuid = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); //Todo: USe uuid package

    task.uuid = uuid;
    task.actionType = 'todo_add';

    syncTaskBox.add(task);
  }

  void addCategory(SyncCategory category) {
    final uuid = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); //Todo: USe uuid package

    category.uuid = uuid;
    category.actionType = 'catagory_add';

    syncCategoryBox.add(category);
  }

  void addTaskInBox(SyncTask task) {
    syncTaskBox.add(task);
  }

  void addCategoryInBox(SyncCategory task) {
    syncCategoryBox.add(task);
  }

  void updateCategory(SyncCategory category) {
    if (!category.isUUIDSet()) {
      final uuid = DateTime.now()
          .millisecondsSinceEpoch
          .toString(); //Todo: Use uuid package
      category.uuid = uuid;
      if (category.isInBox) {
        category.save();
      }
    }

    if (!category.isActionTypeSet()) {
      category.actionType =
          'catagory_update'; // TODO: Set action type = update_todo or something
    }

    syncCategoryBox.add(category);
  }

  void updateTask(SyncTask task) {
    if (!task.isUUIDSet()) {
      final uuid = DateTime.now()
          .millisecondsSinceEpoch
          .toString(); //Todo: Use uuid package
      task.uuid = uuid;
      if (task.isInBox) {
        task.save();
      }
    }

    if (!task.isActionTypeSet()) {
      task.actionType =
          'todo_update'; // TODO: Set action type = update_todo or something
    }

    syncTaskBox.add(task);
  }

  void deleteTask(String tempId) {
    if (hasTask(tempId)) {
      syncTaskBox.values
          .where((element) => element.tempId == tempId)
          .first
          .delete();

      return;
    }

    final deletion_task = SyncTask()
      ..tempId = tempId
      ..actionType = 'delete'
      ..uuid = 'adfas';

    deletion_task.actionType = 'todo_delete';

    syncTaskBox.add(deletion_task);
  }

  void deleteCategory(String tempId) {
    if (hasCategory(tempId)) {
      syncCategoryBox.values
          .where((element) => element.tempId == tempId)
          .first
          .delete();

      return;
    }

    final deletionCategory = SyncCategory()
      ..tempId = tempId
      ..actionType = 'delete'
      ..uuid = 'adfas'; //Todo: chagne

    deletionCategory.actionType = 'catagory_delete';

    syncCategoryBox.add(deletionCategory);
  }

  bool hasTask(String tempId) {
    return syncTaskBox.values
        .where((element) => element.tempId == tempId)
        .isNotEmpty;
  }

  SyncTask getTask(String tempId) {
    return syncTaskBox.values
        .where((element) => element.tempId == tempId)
        .first;
  }

  bool hasCategory(String tempId) {
    return syncCategoryBox.values
        .where((element) => element.tempId == tempId)
        .isNotEmpty;
  }

  SyncCategory getCategory(String tempId) {
    return syncCategoryBox.values
        .where((element) => element.tempId == tempId)
        .first;
  }

  void deleteEntries(List<String> tempIds) {
    syncCategoryBox.values.forEach((element) {
      if (tempIds.contains(element.tempId)) {
        element.delete();
      }
    });
    syncTaskBox.values.forEach((element) {
      if (tempIds.contains(element.tempId)) {
        element.delete();
      }
    });
  }

  List<SyncTask> get getAllSyncTasks => syncTaskBox.values.toList();
  List<SyncCategory> get getAllSyncCategories =>
      syncCategoryBox.values.toList();
}
