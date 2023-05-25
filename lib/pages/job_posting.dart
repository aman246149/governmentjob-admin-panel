import 'package:flutter/material.dart';

import '../forms/job_posting_form.dart';

class JobPosting extends StatelessWidget {
  const JobPosting({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(  body: JobPostingForm(),);
  }
}