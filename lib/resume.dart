import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:pdfx/pdfx.dart';

class Resume extends StatelessWidget {
  const Resume({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: "Resume",
      body: Expanded(
        child: ResumeView(),
      ),
    );
  }

  Widget ResumeView() {
    final pdfController = PdfController(
      document: PdfDocument.openAsset('resume.pdf'),
    );
    return PdfView(
      controller: pdfController,
    );
  }
}
