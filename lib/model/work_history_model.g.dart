// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkHistoryModelAdapter extends TypeAdapter<WorkHistoryModel> {
  @override
  final int typeId = 4;

  @override
  WorkHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkHistoryModel(
      employername: fields[0] as String?,
      enddate: fields[3] as String?,
      jobtitle: fields[1] as String?,
      startdate: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkHistoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.employername)
      ..writeByte(1)
      ..write(obj.jobtitle)
      ..writeByte(2)
      ..write(obj.startdate)
      ..writeByte(3)
      ..write(obj.enddate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
