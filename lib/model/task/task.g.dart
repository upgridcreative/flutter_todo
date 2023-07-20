// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task()
      ..tempId = fields[0] as String
      ..realId = fields[1] as String?
      ..content = fields[2] as String
      ..description = fields[3] as String?
      ..parentTempId = fields[4] as String?
      ..parentRealId = fields[5] as String?
      ..childOrder = fields[6] as int?
      ..isChecked = fields[7] as bool
      ..categoryTempId = fields[8] as String?
      ..categoryRealId = fields[9] as String?
      ..due = fields[10] as String?
      ..isSynced = fields[11] as String?;
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.tempId)
      ..writeByte(1)
      ..write(obj.realId)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.parentTempId)
      ..writeByte(5)
      ..write(obj.parentRealId)
      ..writeByte(6)
      ..write(obj.childOrder)
      ..writeByte(7)
      ..write(obj.isChecked)
      ..writeByte(8)
      ..write(obj.categoryTempId)
      ..writeByte(9)
      ..write(obj.categoryRealId)
      ..writeByte(10)
      ..write(obj.due)
      ..writeByte(11)
      ..write(obj.isSynced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
