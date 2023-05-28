
import 'package:flutter/material.dart';
import 'package:governmentjobadmin/services/pushnotification.dart';
import 'package:governmentjobadmin/utils/custom_snackbar.dart';

class NotificationProvider extends ChangeNotifier{
  bool isLoading=false;


  Future<void> sendPushNotification(Map data,BuildContext context)async{
    try {
      isLoading=true;
      notifyListeners();
     await SendPushNotification.sendPushNotification(data);
      isLoading=false;
      notifyListeners();
    } catch (e) {
      isLoading=false;
      notifyListeners();
      errorSnackBar(context, e.toString());
    }
  }
}