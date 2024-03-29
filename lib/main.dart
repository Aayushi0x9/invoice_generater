import 'package:flutter/material.dart';
import 'package:invoice_generater/Pages/HomePage/home_page.dart';
import 'package:invoice_generater/Pages/SplashPage/splash_page.dart';
import 'package:invoice_generater/utils/routes_utils.dart';

import 'Pages/ItemPage/item_page.dart';
import 'Pages/PdfPage/pdfpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRotes.splashScreen: (context) => SplashScreen(),
        MyRotes.homePage: (context) => HomePage(),
        MyRotes.itemPage: (context) => ItemPage(),
        MyRotes.pdfPage: (context) => PDFPage(),
      },
    );
  }
}
