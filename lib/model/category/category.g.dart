// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category()
      ..tempId = fields[0] as String
      ..realId = fields[1] as String?
      ..title = fields[2] as String
      ..color = fields[3] as String
      ..isSynced = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.tempId)
      ..writeByte(1)
      ..write(obj.realId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.isSynced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
