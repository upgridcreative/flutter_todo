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
    final new_task = SyncTask();

    new_task.content = content;
    new_task.tempId = tempId;
    new_task.description = description;
    new_task.isChecked = isChecked ?? false;
    new_task.categoryTempId = categoryTempId;
    new_task.due = due;

    SyncLocalDataSource.instance.addTask(new_task);
  }

  static void updateContent(
      {required String newContent, required String tempId}) {
    if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.content = newContent;
      task.save();
      return;
    }

    final new_task = SyncTask()..content = newContent 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(new_task);
    
  }

  static void updateDescription(
      {required String newDescription, required String tempId}) {

            if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.description = newDescription;
      task.save();
      return;
    }

    final new_task = SyncTask()..description = newDescription 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(new_task);
      }

  static void toggleIsChecked(
      {required String tempId, required bool isChecked}) {
          if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.isChecked = isChecked;
      task.save();
      return;
    }

    final new_task = SyncTask()..isChecked = isChecked 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(new_task);
        
      }
  static void addCategory({required String tempId, required categoryTempId}) {
       if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.categoryTempId = categoryTempId;
      task.save();
      return;
    }

    final new_task = SyncTask()..categoryTempId = categoryTempId 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(new_task);
        
  }

  static void removeCategory({required String tempId}) {
           if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.categoryTempId = null;
      task.save();
      return;
    }

    final new_task = SyncTask()..categoryTempId = null 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(new_task);
        
  }
  static void setDue({required String tempId, required String? dueDate}) {
           if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getTask(tempId);

      task.due = dueDate;
      task.save();
      return;
    }

    final new_task = SyncTask()..due = dueDate 
    ..tempId = tempId;

    SyncLocalDataSource.instance.updateTask(new_task);
        
  }
  static void delete({required String tempId}) {
    SyncLocalDataSource.instance.deleteTask(tempId);
  }
}
