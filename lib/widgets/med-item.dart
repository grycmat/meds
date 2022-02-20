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
    return ClipRect(
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.6),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              height: 100,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                FaIcon(
                  FontAwesomeIcons.pills,
                  size: 36,
                  color: Colors.black.withOpacity(0.6),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.medName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        FrequencyNames[item.frequency]!,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.6)),
                      ),
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
