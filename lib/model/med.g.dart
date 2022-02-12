// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'med.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedAdapter extends TypeAdapter<Med> {
  @override
  final int typeId = 1;

  @override
  Med read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Med(
      frequency: fields[1] as Frequency,
      medName: fields[2] as String,
      medType: fields[3] as MedType,
      dozes: (fields[4] as List).cast<int>(),
      times: (fields[5] as List).cast<TimeOfDay>(),
      comment: fields[6] as String?,
      supplies: fields[7] as int?,
      used: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Med obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.frequency)
      ..writeByte(2)
      ..write(obj.medName)
      ..writeByte(3)
      ..write(obj.medType)
      ..writeByte(4)
      ..write(obj.dozes)
      ..writeByte(5)
      ..write(obj.times)
      ..writeByte(6)
      ..write(obj.comment)
      ..writeByte(7)
      ..write(obj.supplies)
      ..writeByte(8)
      ..write(obj.used);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FrequencyAdapter extends TypeAdapter<Frequency> {
  @override
  final int typeId = 2;

  @override
  Frequency read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Frequency.one;
      case 1:
        return Frequency.two;
      case 3:
        return Frequency.three;
      default:
        return Frequency.one;
    }
  }

  @override
  void write(BinaryWriter writer, Frequency obj) {
    switch (obj) {
      case Frequency.one:
        writer.writeByte(0);
        break;
      case Frequency.two:
        writer.writeByte(1);
        break;
      case Frequency.three:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FrequencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MedTypeAdapter extends TypeAdapter<MedType> {
  @override
  final int typeId = 4;

  @override
  MedType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return MedType.pill;
      case 2:
        return MedType.syringe;
      case 3:
        return MedType.test;
      default:
        return MedType.pill;
    }
  }

  @override
  void write(BinaryWriter writer, MedType obj) {
    switch (obj) {
      case MedType.pill:
        writer.writeByte(1);
        break;
      case MedType.syringe:
        writer.writeByte(2);
        break;
      case MedType.test:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
