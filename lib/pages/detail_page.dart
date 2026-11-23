// pages/detail_page.dart

import 'package:flutter/material.dart';
import '../models/coffee.dart';

class DetailPage extends StatelessWidget {
  final Coffee coffee;

  const DetailPage({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8EF),
        foregroundColor: const Color(0xFF51321F),
        elevation: 0,
        title: const Text(
          'Detail Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            Hero(
              tag: 'coffee-${coffee.id}',
              createRectTween: (begin, end) {
                return MaterialRectArcTween(
                  begin: begin,
                  end: end,
                );
              },
              flightShuttleBuilder: (
                flightContext,
                animation,
                direction,
                fromHeroContext,
                toHeroContext,
              ) {
                final child = direction == HeroFlightDirection.push
                    ? toHeroContext.widget
                    : fromHeroContext.widget;

                final borderRadius = BorderRadiusTween(
                  begin: BorderRadius.circular(
                    direction == HeroFlightDirection.push ? 50 : 24,
                  ),
                  end: BorderRadius.circular(
                    direction == HeroFlightDirection.push ? 24 : 50,
                  ),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                );

                return AnimatedBuilder(
                  animation: animation,
                  child: (child as Hero).child,
                  builder: (context, child) {
                    return ClipRRect(
                      borderRadius: borderRadius.value ?? BorderRadius.circular(24),
                      child: child,
                    );
                  },
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: double.infinity,
                  height: 280,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD8B18A),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    coffee.icon,
                    style: const TextStyle(fontSize: 110),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              coffee.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF51321F),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              coffee.harga,
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xFF9B6845),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x18000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Menu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF51321F),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    coffee.deskripsi,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: coffee.tersedia
                    ? Colors.green.shade100
                    : Colors.red.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                coffee.tersedia
                    ? 'Menu Tersedia'
                    : 'Menu Habis',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: coffee.tersedia
                      ? Colors.green.shade900
                      : Colors.red.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
