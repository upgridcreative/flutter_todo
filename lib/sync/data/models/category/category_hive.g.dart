// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SyncCategoryAdapter extends TypeAdapter<SyncCategory> {
  @override
  final int typeId = 11;

  @override
  SyncCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SyncCategory()
      ..tempId = fields[0] as String
      ..title = fields[1] as String?
      ..actionType = fields[2] as String
      ..creationDateTime = fields[3] as String?
      ..uuid = fields[9] as String;
  }

  @override
  void write(BinaryWriter writer, SyncCategory obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.tempId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.actionType)
      ..writeByte(3)
      ..write(obj.creationDateTime)
      ..writeByte(9)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
