import 'package:flutter/material.dart';
import 'package:governmentjobadmin/pages/signup.dart';
import 'package:governmentjobadmin/providers/authprovider.dart';
import 'package:provider/provider.dart';

class LoginInScreen extends StatelessWidget {
   LoginInScreen({super.key});
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width/2
          ),
          child: Card(
            margin: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   TextField(
                    controller: email,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 20.0),
                   TextField(
                    obscureText: true,
                    controller: password,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 20.0),
                context.watch<AuthProvider>().isLoading?const CircularProgressIndicator():
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthProvider>().login(email.text, password.text, context);
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUpPage(),));
                    },
                    child: const Text("Don't have an account? Sign up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}