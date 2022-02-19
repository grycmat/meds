import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/model/frequency-names.dart';
import 'package:meds/model/med.dart';

class MedItem extends StatelessWidget {
  final Med item;
  const MedItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ClipRect(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.5),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SizedBox(
              height: 100,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const FaIcon(FontAwesomeIcons.pills),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.medName),
                      Text(FrequencyNames[item.frequency]!),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
