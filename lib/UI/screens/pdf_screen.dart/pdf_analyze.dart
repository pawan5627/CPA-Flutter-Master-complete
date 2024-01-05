import 'dart:io';
import 'package:cpa/UI/screens/pdf_screen.dart/pdf_api.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cpa/data/analyze_data.dart';

class PdfAnalyzeApi {
  static Future<File> generate(AnalyzeData analyze) async {
    final pdf = pw.Document();

    // Load your TTF or OTF font file
    final ttfFont = await rootBundle.load('assets/fonts/Times Regular.ttf');
    final font = pw.Font.ttf(ttfFont);

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text('Hello World', style: pw.TextStyle(font: font)),
        );
      },
    ));

    return PdfApi.saveDocument(name: 'my_analyze.pdf', pdf: pdf);
  }
}
