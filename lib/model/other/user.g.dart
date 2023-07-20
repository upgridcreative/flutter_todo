// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 0;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData()
      ..email = fields[0] as String
      ..firstName = fields[1] as String
      ..lastName = fields[2] as String?
      ..access = fields[3] as String
      ..refresh = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.access)
      ..writeByte(4)
      ..write(obj.refresh);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaDataAdapter extends TypeAdapter<MetaData> {
  @override
  final int typeId = 4;

  @override
  MetaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetaData()..lastSyncToken = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, MetaData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.lastSyncToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
