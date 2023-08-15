// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SyncTaskAdapter extends TypeAdapter<SyncTask> {
  @override
  final int typeId = 10;

  @override
  SyncTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SyncTask()
      ..tempId = fields[0] as String
      ..content = fields[1] as String?
      ..description = fields[2] as String?
      ..isChecked = fields[3] as bool?
      ..categoryTempId = fields[4] as String?
      ..due = fields[5] as String?
      ..creationDateTime = fields[7] as String?
      ..actionType = fields[8] as String
      ..uuid = fields[9] as String;
  }

  @override
  void write(BinaryWriter writer, SyncTask obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.tempId)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.isChecked)
      ..writeByte(4)
      ..write(obj.categoryTempId)
      ..writeByte(5)
      ..write(obj.due)
      ..writeByte(7)
      ..write(obj.creationDateTime)
      ..writeByte(8)
      ..write(obj.actionType)
      ..writeByte(9)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
