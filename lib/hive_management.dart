import 'package:flutter_todo/model/category/category.dart';
import 'package:flutter_todo/model/other/user.dart';
import 'package:flutter_todo/model/task/task.dart';

import 'package:hive/hive.dart';

class HiveManagement {
  static void registerAdapters() {
    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(MetaDataAdapter());
  }

  static Future<void> openBoxes() async {
    await Hive.openBox<Task>('tasks');
    await Hive.openBox<Category>('categories');
    await Hive.openBox<UserData>('user');
    await Hive.openBox<MetaData>('meta');
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
    final entries = box.keys;
    final catentries = cat.keys;

    await cat.deleteAll(catentries);
    await box.deleteAll(entries);


  }
}
