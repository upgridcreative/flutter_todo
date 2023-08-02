import 'package:flutter_todo/sync/data/models/task/task_hive.dart';
import 'package:flutter_todo/sync/data/models/category/category_hive.dart';
import 'package:http/http.dart';

import 'model/category/category.dart';
import 'model/other/user.dart';
import 'model/task/task.dart';

import 'package:hive/hive.dart';

class HiveManagement {
  static void registerAdapters() {
    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(MetaDataAdapter());
    Hive.registerAdapter(SyncTaskAdapter());
    Hive.registerAdapter(SyncCategoryAdapter());
  }

  static Future<void> openBoxes() async {
    await Hive.openBox<Task>('tasks');
    await Hive.openBox<Category>('categories');
    await Hive.openBox<UserData>('user');
    await Hive.openBox<MetaData>('meta');
    await Hive.openBox<SyncTask>('sync_tasks');
    await Hive.openBox<SyncCategory>('sync_categories');
  }

  static Future<void> openBoxesLazy() async {
    await Hive.openLazyBox<Task>('tasks');
    await Hive.openLazyBox<Category>('categories');
    await Hive.openLazyBox<UserData>('user');
    await Hive.openLazyBox<MetaData>('meta');
  }

  static Future<void> deleteAll() async {
    final box = Hive.box<Task>('tasks');
    final cat = Hive.box<Category>('categories');
    final sscat = Hive.box<SyncTask>('sync_tasks');
    final scat = Hive.box<SyncCategory>('sync_categories');
    final entries = box.keys;
    final entriddes = sscat.keys;
    final entrides = scat.keys;
    final catentries = cat.keys;

    await sscat.deleteAll(entriddes);
    await scat.deleteAll(entrides);
    await cat.deleteAll(catentries);
    await box.deleteAll(entries);


  }
}
