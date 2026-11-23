// models/coffee.dart

class Coffee {
  final String id;
  final String nama;
  final String harga;
  final String deskripsi;
  final String icon;
  bool tersedia;

  Coffee({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.icon,
    this.tersedia = true,
  });
}
