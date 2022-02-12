import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'med.g.dart';

@HiveType(typeId: 1)
class Med extends HiveObject {
  Med(
      {required this.frequency,
      required this.medName,
      required this.medType,
      required this.dozes,
      required this.times,
      this.comment,
      this.supplies,
      this.used});

  @HiveField(1)
  Frequency frequency;

  @HiveField(2)
  String medName;

  @HiveField(3)
  MedType medType;

  @HiveField(4)
  List<int> dozes;

  @HiveField(5)
  List<TimeOfDay> times;

  @HiveField(6)
  String? comment;

  @HiveField(7)
  int? supplies;

  @HiveField(8)
  int? used;
}

@HiveType(typeId: 2)
enum Frequency {
  @HiveField(0)
  one,
  @HiveField(1)
  two,
  @HiveField(3)
  three
}

@HiveType(typeId: 4)
enum MedType {
  @HiveField(1)
  pill,
  @HiveField(2)
  syringe,
  @HiveField(3)
  test
}
