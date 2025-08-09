import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starting_slicing/app/constants/endpoint.dart';

class HrdPageService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fungsi untuk menyimpan UID dan data user ke "EndPoint"
  Future<void> saveUserToHrdPage() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String uid = user.uid;

      // Mengambil data user dari Firestore berdasarkan UID
      DocumentSnapshot userDoc = await _firestore.collection(Endpoint.openDB).doc(uid).get();

      if (userDoc.exists) {
        String name = userDoc['name'] ?? 'No name';
        String email = userDoc['email'] ?? 'No email';

        // Menyimpan ke koleksi "HrdPage"
        await _firestore.collection(Endpoint.openDB).doc(uid).set({
          'uid': uid,
          'name': name,
          'email': email,
        }, SetOptions(merge: true));
      }
    }
  }

  // Fungsi untuk mengambil data user dari koleksi "HrdPage"
  Future<Map<String, dynamic>?> getUserFromHrdPage() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      DocumentSnapshot hrdPageDoc = await _firestore.collection(Endpoint.openDB).doc(uid).get();

      if (hrdPageDoc.exists) {
        return hrdPageDoc.data() as Map<String, dynamic>;
      }
    }
    return null;
  }
}
