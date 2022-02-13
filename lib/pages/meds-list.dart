import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meds/main.dart';
import 'package:meds/model/frequency-names.dart';
import 'package:meds/model/med.dart';

class MedsList extends StatelessWidget {
  const MedsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Med>(MEDS).listenable(),
      builder: (_, Box<Med> box, __) => ListView.builder(
          itemCount: box.length,
          itemBuilder: (_, index) {
            var item = box.getAt(index)!;
            return Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: const FaIcon(FontAwesomeIcons.pills),
                    title: Text(item.medName),
                    subtitle: Text(FrequencyNames[item.frequency]!),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
