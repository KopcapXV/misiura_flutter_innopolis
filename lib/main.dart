import 'package:flutter/material.dart';
import 'ui/screens/catalog_screen.dart';

void main() {
  runApp(const SpaceCatalogApp());
}

class SpaceCatalogApp extends StatelessWidget {
  const SpaceCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Космический каталог',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F5F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0.5,
          centerTitle: false,
        ),
      ),
      home: const CatalogScreen(),
    );
  }
}