import 'package:flutter/material.dart';
import 'package:governmentjobadmin/dataRepository/jobs_repository.dart';
import 'package:governmentjobadmin/utils/custom_snackbar.dart';

class JobProvider extends ChangeNotifier{
  bool isLoading=false;

  Future<dynamic> postJob(BuildContext context,Map<String,dynamic> data)async{
    try {
      isLoading=true;
      notifyListeners();
      await JobRepository.postJobs(data);

      isLoading=false;
      notifyListeners();
    } catch (e) {
      isLoading=false;
      notifyListeners();
      errorSnackBar(context, e.toString());
    }
  }
}