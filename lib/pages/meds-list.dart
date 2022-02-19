import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meds/main.dart';
import 'package:meds/model/frequency-names.dart';
import 'package:meds/model/med.dart';
import 'package:meds/widgets/med-item.dart';

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
                MedItem(item: item),
              ],
            );
          }),
    );
  }
}
