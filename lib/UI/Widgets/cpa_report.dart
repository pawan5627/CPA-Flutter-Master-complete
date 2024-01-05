// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// Future<void> generatePdf(
//   String fullName,
//   String fullAddress,
//   String duration,
//   int numberOfAdults,
//   int numberOfChildren,
// ) async {
//   final pdf = pw.Document();

//   // Load the image from your assets
//   final pdfImage = PdfImage.file(
//     pdf.document,
//     bytes: (await rootBundle.load('assets/cpalogo.png')).buffer.asUint8List(),
//   );

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text('Comprehensive Preparedness Analysis (CPA)',
//                 style: pw.TextStyle(fontSize: 18)),
//             pw.SizedBox(height: 20), // Add space between text and image
//             pw.Image(pdfImage, width: 200, height: 100), // Use the PdfImage
//             pw.SizedBox(height: 20), // Add space between image and user data
//             pw.Text('Full Name: $fullName'),
//             pw.Text('Full Address: $fullAddress'),
//             pw.Text('Duration: $duration'),
//             pw.Text('Adults: $numberOfAdults'),
//             pw.Text('Children: $numberOfChildren'),
//             // Add more content as needed
//           ],
//         );
//       },
//     ),
//   );

//   // Save the PDF file to a specific location
//   final outputDir =
//       await getApplicationDocumentsDirectory(); // Use getApplicationDocumentsDirectory for mobile
//   final file = File('${outputDir.path}/example.pdf');
//   await file.writeAsBytes(await pdf.save());

//   // You can use a PDF viewer or file picker plugin to open the PDF on non-web platforms
//   // For web, you can provide a download link for the user to download the PDF
// }
