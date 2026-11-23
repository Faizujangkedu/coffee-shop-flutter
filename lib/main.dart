// main.dart

import 'package:flutter/material.dart';
import 'pages/katalog_page.dart';

void main() {
  runApp(const CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8EF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5E3C),
        ),
      ),
      home: const KatalogPage(),
    );
  }
}
