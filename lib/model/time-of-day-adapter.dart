import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  TimeOfDay read(BinaryReader reader) {
    final timeOfDayList = reader.readList();
    return TimeOfDay(hour: timeOfDayList[0], minute: timeOfDayList[1]);
  }

  @override
  int get typeId => 101;

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer.writeList([obj.hour, obj.minute]);
  }
}
