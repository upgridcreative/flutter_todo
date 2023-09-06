import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../data/datasources/local_datasource.dart';
import '../data/models/category/category_hive.dart';
import '../data/models/task/task_hive.dart';
import '../data/repository/sync_downstrea.dart';
import '../data/repository/sync_upstream.dart';

class SyncToolKit {
  static final SyncToolKit _syncToolKit = SyncToolKit._internal();

  SyncToolKit._internal();

  factory SyncToolKit() {
    return _syncToolKit;
  }

  final localDataSource = SyncLocalDataSource.instance;
  final SyncDataUpSteam repo = Get.find();
  final SyncDataDownStream downRepo = Get.find();
  final _storage = const FlutterSecureStorage();

  List prepareSync() {
    final allTasks = localDataSource.getAllSyncTasks;
    final allCategories = localDataSource.getAllSyncCategories;
    final categoryTempIds = [];
    final taskTempIds = [];

    Map<String, List<Map>> baseTemplate = {
      'actions': [],
    };

    for (SyncCategory category in allCategories) {
      final uuid = category.uuid;
      final actionType = category.actionType;
      final tempId = category.tempId;

      categoryTempIds.add(tempId);

      if (actionType == 'catagory_delete') {
        final action = {
          'uuid': uuid,
          'args': {
            'catagory_id': tempId,
          },
          'type': actionType,
        };
        baseTemplate['actions']?.add(action);
        continue;
      }

      final args = category.toJson();

      final action = {
        'uuid': uuid,
        'temp_id': tempId,
        'args': args,
        'type': actionType,
      };
      baseTemplate['actions']?.add(action);
    }

    for (SyncTask task in allTasks) {
      final uuid = task.uuid;
      final actionType = task.actionType;
      final tempId = task.tempId;

      taskTempIds.add(tempId);

      if (actionType == 'todo_delete') {
        final action = {
          'uuid': uuid,
          'args': {
            'todo_id': tempId,
          },
          'type': actionType,
        };
        baseTemplate['actions']?.add(action);
        continue;
      }

      final args = task.toJson();

      final action = {
        'uuid': uuid,
        'temp_id': tempId,
        'args': args,
        'type': actionType,
      };
      baseTemplate['actions']?.add(action);
    }


    return [baseTemplate, categoryTempIds, taskTempIds];
  }

  Future<void> syncData() async {
    syncDataUpStream();
    syncDataDownStream();
  }

  Future<void> syncDataUpStream() async {
    final unSyncedDataBundle = prepareSync();

    final unSyncedData = unSyncedDataBundle[0];
    final categoriesTempIds = unSyncedDataBundle[1];
    final taskTempIds = unSyncedDataBundle[2];

    final response = await repo.syncUpstream(unSyncedData);

    if (response.statusCode != 200) {
      return;
    }

    // final data = response.data;
    //Todo: map Real Id from tempIdMapping

    localDataSource.deleteEntries([...categoriesTempIds, ...taskTempIds]);
  }

  Future<void> syncDataDownStream() async {
    final syncToken = await _storage.read(key: 'syncToken');
    downRepo.syncDataDownStream({
      'resources': [
        'all',
      ],
      'sync_token': syncToken,
    });
  }
}
