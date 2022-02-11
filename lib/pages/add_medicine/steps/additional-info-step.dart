import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdditionalInfoStep extends StatelessWidget {
  const AdditionalInfoStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Stock',
              border: OutlineInputBorder(),
              prefixIcon: SizedBox(
                width: 20,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.medkit),
                ),
              )),
        ),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Comment',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
