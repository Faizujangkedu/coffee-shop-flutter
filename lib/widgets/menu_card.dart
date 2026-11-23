// widgets/menu_card.dart

import 'package:flutter/material.dart';
import '../models/coffee.dart';

class MenuCard extends StatefulWidget {
  final Coffee coffee;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.coffee,
    required this.onTap,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  Coffee get coffee => widget.coffee;

  void _ubahKetersediaan() {
    setState(() {
      coffee.tersedia = !coffee.tersedia;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          coffee.tersedia
              ? '${coffee.nama} tersedia kembali'
              : '${coffee.nama} telah habis',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: coffee.tersedia ? 1.0 : 0.4,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: _ubahKetersediaan,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: coffee.tersedia
                  ? const [
                      Color(0xFFFFF8EF),
                      Color(0xFFEBD5BD),
                    ]
                  : const [
                      Color(0xFFE0E0E0),
                      Color(0xFFBDBDBD),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFB78B62),
              width: 1.2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Hero(
                tag: 'coffee-${coffee.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD8B18A),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      coffee.icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.nama,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF51321F),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      coffee.harga,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8B5E3C),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      coffee.tersedia ? 'Tersedia' : 'Habis',
                      style: TextStyle(
                        fontSize: 12,
                        color: coffee.tersedia
                            ? Colors.green.shade800
                            : Colors.red.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                coffee.tersedia
                    ? Icons.arrow_forward_ios
                    : Icons.block,
                color: const Color(0xFF8B5E3C),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
