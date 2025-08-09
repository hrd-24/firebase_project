import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:starting_slicing/app/feature/model/donasi_model.dart';

class DonasiService {
  final CollectionReference donasiCollection =
      FirebaseFirestore.instance.collection('donasi');

  // Ambil donasi secara realtime
  Stream<List<DonasiModel>> getDonasiUser() {
    return donasiCollection
        .orderBy('tanggal', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => DonasiModel.fromFirestore(doc)).toList());
  }

  // Tambah donasi
  Future<void> tambahDonasi(String nama, String jumlah) async {
    await donasiCollection.add({
      'nama': nama,
      'jumlah': jumlah,
      'status': 'Pending',
      'tanggal': FieldValue.serverTimestamp(),
    });
  }

  // Update status donasi
  Future<void> updateStatus(String id, String newStatus) async {
    await donasiCollection.doc(id).update({'status': newStatus});
  }
}
