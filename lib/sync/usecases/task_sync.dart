import '../data/datasources/local_datasource.dart';
import '../data/models/task/task_hive.dart';

class TaskSyncHelper {
  static void addTask({
    required String content,
    required String tempId,
    String? description,
    bool? isChecked,
    String? categoryTempId,
    String? due,
  }) {
    final newTask = SyncTask();

    newTask.content = content;
    newTask.tempId = tempId;
    newTask.description = description;
    newTask.isChecked = isChecked ?? false;
    newTask.categoryTempId = categoryTempId;
    newTask.due = due;

    SyncLocalDataSource.instance.addTask(newTask);
  }

  static void updateContent(
      {required String newContent, required String tempId}) {
    if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.content = newContent;
      task.save();
      return;
    }

    final newTask = SyncTask()..content = newContent 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(newTask);
    
  }

  static void updateDescription(
      {required String newDescription, required String tempId}) {

            if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.description = newDescription;
      task.save();
      return;
    }

    final newTask = SyncTask()..description = newDescription 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(newTask);
      }

  static void toggleIsChecked(
      {required String tempId, required bool isChecked}) {
          if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.isChecked = isChecked;
      task.save();
      return;
    }

    final newTask = SyncTask()..isChecked = isChecked 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(newTask);
        
      }
  static void addCategory({required String tempId, required categoryTempId}) {
       if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.categoryTempId = categoryTempId;
      task.save();
      return;
    }

    final newTask = SyncTask()..categoryTempId = categoryTempId 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(newTask);
        
  }

  static void removeCategory({required String tempId}) {
           if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.categoryTempId = null;
      task.save();
      return;
    }

    final newTask = SyncTask()..categoryTempId = null 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(newTask);
        
  }
  static void setDue({required String tempId, required String? dueDate}) {
           if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.due = dueDate;
      task.save();
      return;
    }

    final newTask = SyncTask()..due = dueDate 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(newTask);
        
  }
  static void delete({required String tempId}) {
    SyncLocalDataSource.instance.deleteTask(tempId);
  }
}
