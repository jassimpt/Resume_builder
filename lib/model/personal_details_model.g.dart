// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalDetailsModelAdapter extends TypeAdapter<PersonalDetailsModel> {
  @override
  final int typeId = 2;

  @override
  PersonalDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalDetailsModel(
      dob: fields[5] as String?,
      phone: fields[2] as String?,
      email: fields[7] as String?,
      firstname: fields[0] as String?,
      gender: fields[4] as String?,
      lastname: fields[1] as String?,
      nationality: fields[6] as String?,
      profession: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalDetailsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.firstname)
      ..writeByte(1)
      ..write(obj.lastname)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.profession)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.nationality)
      ..writeByte(7)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
