import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../Global/global.dart';

class PDFPage extends StatefulWidget {
  const PDFPage({super.key});

  @override
  State<PDFPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PDFPage> {
  Future<Uint8List> getPDF() {
    //1. Create object
    pw.Document pdf = pw.Document();

    //2. Design PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text("Hello PDF"),
        ),
      ),
    );

    //3. Convert into Uint8List
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Page"),
      ),
      body: PdfPreview(
        pdfFileName:
            "RESUME_${Globals.globals.o_name?.toUpperCase() ?? "FN_LN"}",
        build: (format) => getPDF(),
      ),
    );
  }
}
