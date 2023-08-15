import '../data/datasources/local_datasource.dart';
import '../data/models/category/category_hive.dart';

class CategorySyncHelper {
  static void addCategory({
    required String content,
    required String tempId,
  }) {
    final new_category = SyncCategory();

    new_category.title = content;
    new_category.tempId = tempId;

    SyncLocalDataSource.instance.addCategory(new_category);
  }

  static void updateContent(
      {required String newContent, required String tempId}) {
    if (SyncLocalDataSource.instance.hasTask(tempId)) {
      final task = SyncLocalDataSource.instance.getCategory(tempId);

      task.title = newContent;
      task.save();
      return;
    }

    final new_category = SyncCategory()
      ..title = newContent
      ..tempId = tempId;

    SyncLocalDataSource.instance.updateCategory(new_category);
  }

  static void delete({required String tempId}) {
    SyncLocalDataSource.instance.deleteCategory(tempId);
  }
}
