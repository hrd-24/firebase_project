// lib/app/feature/model/donasi_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class DonasiModel {
  String id;
  String nama;
  String jumlah;
  String status;
  DateTime? tanggal;

  // Konstruktor: id opsional supaya bisa buat object lokal tanpa id
  DonasiModel({
    this.id = '',
    required this.nama,
    required this.jumlah,
    this.status = 'Pending',
    this.tanggal,
  });

  // Factory untuk membuat DonasiModel dari DocumentSnapshot (Firestore)
  factory DonasiModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? <String, dynamic>{};

    return DonasiModel(
      id: doc.id,
      nama: data['nama']?.toString() ?? '',
      jumlah: data['jumlah']?.toString() ?? '',
      status: data['status']?.toString() ?? 'Pending',
      tanggal: data['tanggal'] != null
          ? (data['tanggal'] as Timestamp).toDate()
          : null,
    );
  }

  // Konversi ke Map untuk disimpan ke Firestore
  Map<String, dynamic> toMap({bool useServerTimestamp = true}) {
    return {
      'nama': nama,
      'jumlah': jumlah,
      'status': status,
      // Jika ingin pakai server timestamp (biasanya saat create), set true.
      'tanggal': useServerTimestamp
          ? FieldValue.serverTimestamp()
          : (tanggal != null ? Timestamp.fromDate(tanggal!) : null),
    };
  }
}
