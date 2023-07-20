import 'package:flutter_todo/model/category/category.dart';
import 'package:flutter_todo/model/task/task.dart';
import 'package:hive/hive.dart';

class TaskRepoDummy {
  static Future<void> createDummyCategories() async {
    final box = Hive.box<Category>('categories');

    final cat1 = Category()
      ..tempId = 'Work'
      ..title = 'Work'
      ..color = 'DCEDC1';

    final cat2 = Category()
      ..tempId = 'School'
      ..title = 'School'
      ..color = 'DCEDC1';

    final cat3 = Category()
      ..tempId = 'Side Project'
      ..title = 'Side Project'
      ..color = 'DCEDC6';

    await box.putAll({
      cat1.tempId: cat1,
      cat2.tempId: cat2,
      cat3.tempId: cat3,
    });
  }

  static Future<void> createDummyTasksWithCategory() async {
    final box = Hive.box<Task>('tasks');

    final task1 = Task()
      ..content = 'Create a new system for backend review'
      ..tempId = 'First todo'
      ..isChecked = true
      ..description =
          'Also include other team members in the meet to finalise this months work load';
    final task2 = Task()
      ..content = 'Buy assets for future visa project'
      ..isChecked = false
      ..categoryTempId = 'Work'
      ..due = '2022-12-22'
      ..tempId = 'Second todo';

    final task3 = Task()
      ..content = 'Third todo'
      ..isChecked = true
      ..categoryTempId = 'Work'
      ..tempId = 'Third todo'
      ..description = 'this is the discriotion';

    await box.putAll({
      task1.tempId: task1,
      task2.tempId: task2,
      task3.tempId: task3,
    });

    return;
  }

  static Future<void> createDummyTasks() async {
    final box = Hive.box<Task>('tasks');

    final task1 = Task()
      ..content = 'First todo'
      ..tempId = 'First todo'
      ..isChecked = true
      ..due = '2022-12-22'
      ..description = 'this is the discriotion';
    final task2 = Task()
      ..content = 'Second todo'
      ..isChecked = false
      ..due = '2022-12-22'
      ..tempId = 'Second todo'
      ..description = 'this is the discriotion';
    final task3 = Task()
      ..content = 'Third todo'
      ..isChecked = true
      ..tempId = 'Third todo'
      ..description = 'this is the discriotion';

    await box.putAll({
      task1.tempId: task1,
      task2.tempId: task2,
      task3.tempId: task3,
    });
  }
}
