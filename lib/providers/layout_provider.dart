

import 'package:flutter/material.dart';
import 'package:governmentjobadmin/pages/job_posting.dart';
import 'package:governmentjobadmin/pages/pushNotification.dart';

class LayoutProvider extends ChangeNotifier{
  List<String> tabs=["Add/Edit Jobs","PushNotification"];
  List<Widget> pages=[ JobPosting(),const PushNotification()];

  PageController controller=PageController();


  void setJumToPage(int pageIndex){
    controller.jumpToPage(pageIndex);
  }

}