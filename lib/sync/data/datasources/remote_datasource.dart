import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../model/category/category.dart';
import '../../../model/task/task.dart';
import '../../../repository/category.dart';
import '../../../repository/task.dart';

class SyncRemoteDataSource extends GetxController {
  final CategoryRepository categoryRepository = Get.find();
  final TaskRepository todoRepository = Get.find();
  final _storage = const FlutterSecureStorage();

  void processData(data) async {
    for (var category in data['catagories']) {
      final tempId = category['temp_id'];
      if (categoryRepository.hasHiveCategoryWithTempId(tempId)) {
        final existingCategory =
            categoryRepository.getHiveCategoryByTempId(tempId);
        final hiveCategory = existingCategory;

        if (category['is_deleted']) {
          hiveCategory.delete(); // Reflect changes later at one movement
          continue;
        }

        category as Map;

        hiveCategory.title = category.containsKey('title')
            ? category['title']
            : hiveCategory.title;

        hiveCategory.save();

        continue;
      }

      if (category['is_deleted']) {
        continue;
      }
      if (!category.containsKey('title') && !category.containsKey('temp_id')) {
        continue;
        //Problem with sync token.
      }

      final newCategory = Category();

      newCategory.title = category['title'];
      newCategory.tempId = category['temp_id'];
      newCategory.realId = category['id'].toString();

      categoryRepository.box.add(newCategory);
    }

    for (var task in data['tasks']) {
      final tempId = task['temp_id'];
      if (todoRepository.hasHiveTaskWithTempId(tempId)) {
        final existingTask = todoRepository.getHiveTaskByTempId(tempId);
        final hiveTask = existingTask;

        if (task['is_deleted']) {
          hiveTask.delete(); // Reflect changes later at one movement

          continue;
        }

        task as Map;

        hiveTask.content = task['content'] ?? hiveTask.content;

        hiveTask.description = task['discription'] ?? hiveTask.description;

        hiveTask.isChecked = task['is_checked'] ?? hiveTask.isChecked;

        hiveTask.due = task['due'] ?? hiveTask.due;

        //!Fields would be delivered no matter what, no need to check if key exists as it will always exist.
        hiveTask.categoryTempId = task['catagory'] == null
            ? null
            : task['catagory']['temp_id'] ??
                hiveTask
                    .categoryTempId; 

        hiveTask.realId = task['catagory'] == null
            ? null
            : task['catagory']['id'] != null
                ? task['catagory'].toString()
                : hiveTask
                    .realId; 

        hiveTask.save();

        continue;
      }
      if (task['is_deleted']) {
        continue;
      }
      if (!task.containsKey('title') && !task.containsKey('temp_id')) {
        continue;
        //Problem with sync token.
      }

      final newTask = Task();

      newTask.content = task['content'];
      newTask.tempId = task['temp_id'];

      newTask.description = task['discription'];

      newTask.isChecked = task['is_checked'];

      newTask.due = task.containsKey('due') ? task['due'] : null;
      newTask.categoryTempId =
          task['catagory'] == null ? null : task['catagory']['temp_id'];

      todoRepository.box.add(newTask);
    }

    final syncToken = data['sync_token'];
    await _storage.write(key: 'syncToken', value: syncToken);

    todoRepository.refreshFromDB();
    categoryRepository.refreshFromDB();
  }
}
