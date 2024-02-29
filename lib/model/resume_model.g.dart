// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResumeModelAdapter extends TypeAdapter<ResumeModel> {
  @override
  final int typeId = 1;

  @override
  ResumeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResumeModel(
      education: (fields[1] as List?)?.cast<EducationModel>(),
      summary: fields[4] as String?,
      skills: (fields[3] as List?)?.cast<String>(),
      personaldetails: fields[0] as PersonalDetailsModel?,
      workhistory: (fields[2] as List?)?.cast<WorkHistoryModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ResumeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.personaldetails)
      ..writeByte(1)
      ..write(obj.education)
      ..writeByte(2)
      ..write(obj.workhistory)
      ..writeByte(3)
      ..write(obj.skills)
      ..writeByte(4)
      ..write(obj.summary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResumeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
