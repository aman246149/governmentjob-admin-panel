import 'package:cloud_firestore/cloud_firestore.dart';

class JobRepository{
 static final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

  static Future<dynamic> postJobs(Map<String,dynamic> data)async{
    try {
    await firebaseFirestore.collection("Jobs").add(data); 
    } catch (e) {
      rethrow;
    }
  }
}