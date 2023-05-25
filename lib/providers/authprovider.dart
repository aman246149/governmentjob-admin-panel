
import 'package:flutter/material.dart';
import 'package:governmentjobadmin/pages/homepage.dart';
import 'package:governmentjobadmin/services/auth_service.dart';
import 'package:governmentjobadmin/utils/custom_snackbar.dart';

class AuthProvider extends ChangeNotifier{
  bool isLoading=false;
  
  void login(String email,String password,BuildContext context)async{
      try {
        isLoading=true;
        notifyListeners();
         await  AuthService.loginWithEmailAndPassword(email, password);
        isLoading=false;
        notifyListeners();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomePage(),));
      } catch (e) {
          isLoading=false;
        notifyListeners();
        errorSnackBar(context, e.toString());
      }
  }
  void signUp(String email,String password,BuildContext context)async{
      try {
        isLoading=true;
        notifyListeners();
         await  AuthService.createUserWithEmailAndPassword(email, password);
        isLoading=false;
        notifyListeners();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomePage(),));
      } catch (e) {
          isLoading=false;
        notifyListeners();
        errorSnackBar(context, e.toString());
      }
  }
}

