// import 'package:flutter/material.dart';
// import 'dart:convert';

// class SimpleTag {
//   String tag1;
//   String tag2;
//   String tag3;

//   SimpleTag({required this.tag1, required this.tag2, required this.tag3});

//   factory SimpleTag.fromJson(Map<String, dynamic> json) {
//     return SimpleTag(
//       tag1: json['30 Days'],
//       tag2: json['60 Days'],
//       tag3: json['90 Days'],
//     );
//   }
// }

// class SimpleTagDisplay extends StatelessWidget {
//   final SimpleTag simpleTag;

//   SimpleTagDisplay(required simpleTag, {required this.simpleTag});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Tag 1: ${simpleTag.tag1}'),
//         Text('Tag 2: ${simpleTag.tag2}'),
//         Text('Tag 3: ${simpleTag.tag3}'),
//       ],
//     );
//   }
// }

// void main() {
//   String jsonString =
//       '{"tag1": "30 Days", "tag2": "60 Days", "tag3": "90 Days"}';

//   Map<String, dynamic> tagJson = json.decode(jsonString);
//   SimpleTag tag = SimpleTag.fromJson(tagJson);
// }
