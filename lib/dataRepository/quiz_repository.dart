import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class QuizRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<dynamic> addQuiz(Map<String, dynamic> data) async {
    try {
      await firestore.collection("quiz").add(data);

      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteQuiz() async {
    try {
      QuerySnapshot snapshot = await firestore.collection("quiz").get();
      WriteBatch batch = firestore.batch();

      for (var doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }
}
