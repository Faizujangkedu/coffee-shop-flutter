// pages/katalog_page.dart

import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../data/coffee_data.dart';
import '../widgets/menu_card.dart';
import '../widgets/rotating_coffee.dart';
import 'detail_page.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({super.key});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  void _bukaDetail(Coffee coffee) {
    Navigator.push(
      context,
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailPage(coffee: coffee);
        },
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EF),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER KATALOG
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 25),
              decoration: const BoxDecoration(
                color: Color(0xFFEBD5BD),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'COFFEE SHOP',
                          style: TextStyle(
                            fontSize: 13,
                            letterSpacing: 3,
                            color: Color(0xFF8B5E3C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Find Your Favorite Coffee',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF51321F),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Nikmati kopi terbaik setiap hari.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF79543A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const RotatingCoffee(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // JUDUL MENU
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.local_cafe,
                    color: Color(0xFF8B5E3C),
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Our Coffee Menu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF51321F),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tekan kartu untuk melihat detail.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // DAFTAR MENU
            Expanded(
              child: ListView.builder(
                itemCount: coffeeList.length,
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  final coffee = coffeeList[index];

                  return MenuCard(
                    key: ValueKey(coffee.id),
                    coffee: coffee,
                    onTap: () => _bukaDetail(coffee),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
