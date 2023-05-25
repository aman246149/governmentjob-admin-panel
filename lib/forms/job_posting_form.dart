import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:governmentjobadmin/model/job_model.dart';
import 'package:governmentjobadmin/providers/jobprovider.dart';
import 'package:governmentjobadmin/utils/custom_snackbar.dart';
import 'package:provider/provider.dart';



class JobPostingForm extends StatefulWidget {
  const JobPostingForm({Key? key}) : super(key: key);

  @override
  _JobPostingFormState createState() => _JobPostingFormState();
}

class _JobPostingFormState extends State<JobPostingForm> {
  final TextEditingController jobNameController = TextEditingController();
  final TextEditingController jobCategoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController websiteLinkController = TextEditingController();
  final TextEditingController dateUploadedController = TextEditingController();
  final TextEditingController lastDateController = TextEditingController();
  final TextEditingController salaryRangeController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateUploadedController.text=DateTime.now().toString();
  }

 Future<void> _selectLastDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        lastDateController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: jobNameController,
                    decoration: InputDecoration(
                      labelText: 'Job Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a job name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: jobCategoryController,
                    decoration: InputDecoration(
                      labelText: 'Job Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a job category';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: websiteLinkController,
                    decoration: InputDecoration(
                      labelText: 'Website Link',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a website link';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    controller: dateUploadedController,
                    decoration: InputDecoration(
                      labelText: 'Date Uploaded',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a date uploaded';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectLastDate(context);
                    },
                    child: TextFormField(
                      enabled: false,
                      controller: lastDateController,
                      decoration: InputDecoration(
                        labelText: 'Last Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a last date';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: salaryRangeController,
                    decoration: InputDecoration(
                      labelText: 'Salary Range',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a salary range';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: qualificationController,
                    decoration: InputDecoration(
                      labelText: 'Qualification',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a qualification';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
          
            context.watch<JobProvider>().isLoading?const Center(child: CircularProgressIndicator(),):
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 15)),
                    onPressed: () async{
                      if(jobCategoryController.text.isEmpty || jobCategoryController.text.isEmpty || descriptionController.text.isEmpty || websiteLinkController.text.isEmpty || lastDateController.text.isEmpty ||qualificationController.text.isEmpty){
                        errorSnackBar(context, "PLease enter all fields");
                        return;
                      }
                      
                     JobModel jobModel=JobModel(
                                      jobName: jobNameController.text, 
                                      jobCategory: jobCategoryController.text, 
                                      description: descriptionController.text, 
                                      applyLink: "", websiteLink: websiteLinkController.text, 
                                      dateUploaded: DateTime.now(),
                                      lastDate: DateTime.parse(lastDateController.text),
                                      qualification: qualificationController.text,
                                      salaryRange: salaryRangeController.text);


                      context.read<JobProvider>().postJob(context, jobModel.toJson());
                  }, child: Text("Submit",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),),),
                ),
                SizedBox(width: 15,),

                Expanded(child: ElevatedButton(
                   style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 15),),

                  onPressed: () {
                    jobNameController.clear();
                    jobCategoryController.clear();
                    descriptionController.clear();
                    websiteLinkController.clear();
                    dateUploadedController.clear();
                    lastDateController.clear();
                    salaryRangeController.clear();
                    qualificationController.clear();
                    setState(() {
                      
                    });
                }, child: Text("Reset Form",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),)),)
              ],
            ),
          ],
        ),
      )
   ;
  }
}
