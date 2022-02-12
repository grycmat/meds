import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meds/model/med.dart';
import 'package:meds/pages/home.dart';

const MEDS = 'meds';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Frequency>(FrequencyAdapter());
  Hive.registerAdapter<MedType>(MedTypeAdapter());
  Hive.registerAdapter<TimeOfDay>(TimeOfDayAdapter());
  Hive.registerAdapter<Med>(MedAdapter());
  await Hive.openBox<Med>(MEDS);
  runApp(const Meds());
}

class Meds extends StatelessWidget {
  const Meds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const Home(),
    );
  }
}
