// import 'package:flutter/material.dart';

// class ProductLink {
//   final String title;
//   final String url;
//   final String imageUrl;

//   ProductLink(this.title, this.url, this.imageUrl);
// }

// class ProductGridView extends StatelessWidget {
//   final List<ProductLink> productLinks;
//   final String appBarTitle;

//   ProductGridView({
//     required this.productLinks,
//     required this.appBarTitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(appBarTitle),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 1, // Adjust the crossAxisCount to your preference
//         ),
//         itemCount: productLinks.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             margin: EdgeInsets.all(8.0),
//             child: ListTile(
//               title: Column(
//                 children: [
//                   Image.network(
//                     productLinks[index].imageUrl,
//                     width: 100, // Adjust the width as needed
//                     height: 100, // Adjust the height as needed
//                   ),
//                   Text(productLinks[index].title),
//                 ],
//               ),
//               onTap: () {
//                 // Handle link navigation or any other action here
//                 print('Tapped on: ${productLinks[index].title}');
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
