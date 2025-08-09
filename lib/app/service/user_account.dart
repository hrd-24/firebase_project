import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starting_slicing/app/constants/endpoint.dart';

class UserCreate {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> createAccount({
  required String name,
  required String email,
  required String password,
}) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = userCredential.user!.uid;
    print("Akun berhasil dibuat. UID: $uid");

    await _firestore.collection(Endpoint.openDB).doc(uid).set({
      "name": name,
      "email": email,
      "created_at": DateTime.now(),
    });

    print("Data berhasil disimpan ke Firestore.");
    return null;
  } on FirebaseAuthException catch (e) {
    print("FirebaseAuthException: ${e.message}");
    return e.message;
  } catch (e) {
    print("Unknown error: $e");
    return "Unknown error: $e";
  }
}

}
