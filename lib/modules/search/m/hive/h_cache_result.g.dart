// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_cache_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedResultAdapter extends TypeAdapter<CachedResult> {
  @override
  final int typeId = 0;

  @override
  CachedResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedResult(
      json: fields[0] as String,
      timestamp: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachedResult obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.json)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
