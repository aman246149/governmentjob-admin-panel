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
}
