// import 'package:flutter/material.dart';

// class TimeDoze extends StatelessWidget {
// const TimeDoze({ Key? key, required int index, required TimeOfDay time, required int doze }) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//     return Row(
//       children: [
//         Expanded(
//           child: TextFormField(
//               onTap: () => showTimePicker(context: context, initialTime: time),
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 prefixIcon: SizedBox(
//                     width: 10,
//                     child: Center(child: FaIcon(FontAwesomeIcons.clock))),
//               ),
//               initialValue:
//                   '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'),
//         ),
//         Expanded(
//           child: TextFormField(
//             keyboardType: TextInputType.number,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               prefixIcon: SizedBox(
//                 width: 10,
//                 child: Center(
//                   child: FaIcon(FontAwesomeIcons.sortNumericUpAlt),
//                 ),
//               ),
//             ),
//             initialValue: doze.toString(),
//           ),
//         ),
//       ],
//     );
//   }
// }