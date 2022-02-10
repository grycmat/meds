// import 'package:flutter/material.dart';
// import 'package:meds/providers/add-medicine-provider.dart';
// import 'package:provider/provider.dart';

// class MainInfoStep extends StatelessWidget {
// const MainInfoStep({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//     return Consumer<AddMedicineProvider>(
//       builder: (context, value, child) => Step(
//                       title: const Text('Medicine'),
//                       content: Column(children: [
//                         TextFormField(
//                           decoration: const InputDecoration(
//                               border: OutlineInputBorder(), labelText: 'Name'),
//                         ),
//                         ToggleButtons(
//                           children: const [
//                             FaIcon(FontAwesomeIcons.pills),
//                             FaIcon(FontAwesomeIcons.syringe),
//                             FaIcon(FontAwesomeIcons.weight),
//                           ],
//                           onPressed: (int index) {
//                             setState(() {
//                               for (var i = 0; i <= index; i++) {
//                                 _medType[i] = index == i ? true : false;
//                               }
//                             });
//                           },
//                           isSelected: _medType,
//                         ),
//                       ]),
//                     ),,);
//   }
// }