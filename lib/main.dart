import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:governmentjobadmin/providers/authprovider.dart';
import 'package:governmentjobadmin/providers/jobprovider.dart';
import 'package:governmentjobadmin/providers/layout_provider.dart';
import 'package:governmentjobadmin/providers/notification_provider.dart';
import 'package:governmentjobadmin/providers/quiz_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LayoutProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:
            FlexThemeData.light(scheme: FlexScheme.greenM3, useMaterial3: true),
        home: SplashScreen(firebaseAuth: FirebaseAuth.instance),
      ),
    );
  }
}
