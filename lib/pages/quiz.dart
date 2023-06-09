import 'package:flutter/material.dart';
import 'package:governmentjobadmin/forms/quiz_form.dart';
import 'package:governmentjobadmin/providers/quiz_provider.dart';
import 'package:governmentjobadmin/utils/custom_snackbar.dart';
import 'package:provider/provider.dart';

import '../widgets/quiz_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return QuizForm();
  }
}
