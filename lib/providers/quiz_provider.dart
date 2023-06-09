import 'package:flutter/material.dart';
import 'package:governmentjobadmin/utils/custom_snackbar.dart';

import '../dataRepository/quiz_repository.dart';

class QuizProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Map<String, dynamic>> data = [];

  final TextEditingController questionTitle = TextEditingController();
  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController field3Controller = TextEditingController();
  final TextEditingController field4Controller = TextEditingController();
  final TextEditingController dropDown = TextEditingController();

  void clearTextField() {
    field1Controller.clear();
    field2Controller.clear();
    field3Controller.clear();
    field4Controller.clear();
    questionTitle.clear();
    dropDown.clear();
  }

  void setQuiz(BuildContext context,Map<String, dynamic> value) async {
    try {
      isLoading = true;
      notifyListeners();
      await QuizRepository().addQuiz(value);
      data = [];
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      errorSnackBar(context, e.toString());
    }
  }

  // void setQuizList(Map<String, dynamic> value, BuildContext context) {
  

  //   setQuiz(context);

  //   notifyListeners();
  // }
}
