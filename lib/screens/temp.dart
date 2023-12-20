// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return

// Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: 40,
//           ),
//           const Text(
//             'OTP',
//             style: TextStyle(fontSize: 20),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: SizedBox(
//               width: 250,
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'OTP',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.phone,
//               ),
//             ),
//           ),
//           Text(
//             'wait for $minutes:${seconds < 10 ? '0$seconds' : '$seconds'} minutes',
//             style: const TextStyle(fontSize: 14),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 '989-989-9999',
//                 style: TextStyle(fontSize: 16),
//               ),
//               TextButton(
//                   onPressed: () {
//                     setState(() {
//                       _isOTP = false;
//                       minutes = 4;
//                       seconds= 0;
//                     });
//                   },
//                   child: const Text('Edit'))
//             ],
//           ),
//           const SizedBox(
//             height: 50,
//           )
//         ],
//       ),
//     );
//   }
// }