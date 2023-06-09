import 'package:flutter/material.dart';
import 'package:governmentjobadmin/pages/job_posting.dart';
import 'package:governmentjobadmin/pages/pushNotification.dart';

import '../pages/quiz.dart';

class LayoutProvider extends ChangeNotifier {
  List<String> tabs = ["Add/Edit Jobs", "PushNotification", "Add/Edit Quiz"];
  List<Widget> pages = [
    const JobPosting(),
    const PushNotification(),
    const QuizScreen()
  ];

  PageController controller = PageController();

  void setJumToPage(int pageIndex) {
    controller.jumpToPage(pageIndex);
  }
}
