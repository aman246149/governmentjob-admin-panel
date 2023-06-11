import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../utils/custom_snackbar.dart';
import '../widgets/quiz_widget.dart';

class QuizForm extends StatefulWidget {
  const QuizForm({super.key});

  @override
  State<QuizForm> createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
  @override
  Widget build(BuildContext context) {
    final quizProvider = context.read<QuizProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        actions: [
          // Row(
          //   children: [
          //     CustomCircle(
          //       text: "1",
          //       color: context.watch<QuizProvider>().data.isEmpty
          //           ? Colors.purpleAccent
          //           : Colors.transparent,
          //     ),
          //     CustomHorizontalDivider(),
          //     CustomCircle(
          //         text: "2",
          //         color: context.watch<QuizProvider>().data.length == 1
          //             ? Colors.purpleAccent
          //             : Colors.transparent),
          //     CustomHorizontalDivider(),
          //     CustomCircle(
          //         text: "3",
          //         color: context.watch<QuizProvider>().data.length == 2
          //             ? Colors.purpleAccent
          //             : Colors.transparent),
          //     CustomHorizontalDivider(),
          //     CustomCircle(
          //         text: "4",
          //         color: context.watch<QuizProvider>().data.length == 3
          //             ? Colors.purpleAccent
          //             : Colors.transparent),
          //     SizedBox(
          //       width: 100,
          //     )
          //   ],
          // )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: quizProvider.questionTitle,
              decoration: const InputDecoration(
                labelText: 'QuestionTitle',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: quizProvider.field1Controller,
                    decoration: const InputDecoration(
                      labelText: 'Option 1',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: quizProvider.field2Controller,
                    decoration: const InputDecoration(
                      labelText: 'Option 2',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: quizProvider.field3Controller,
                    decoration: const InputDecoration(
                      labelText: 'Option 3',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: quizProvider.field4Controller,
                    decoration: const InputDecoration(
                      labelText: 'Option 4',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(
                  value: 'a',
                  child: Text('Option A'),
                ),
                DropdownMenuItem(
                  value: 'b',
                  child: Text('Option B'),
                ),
                DropdownMenuItem(
                  value: 'c',
                  child: Text('Option C'),
                ),
                DropdownMenuItem(
                  value: 'd',
                  child: Text('Option D'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'Dropdown',
              ),
              onChanged: (value) {
                quizProvider.dropDown.text = value ?? "";
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          context.watch<QuizProvider>().isLoading
              ? CircularProgressIndicator()
              : Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              context.read<QuizProvider>().deleteQuiz(context);
                            },
                            child: Text("Delete Previous Quiz"))),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () {
                            if (quizProvider.questionTitle.text.isEmpty ||
                                quizProvider.field1Controller.text.isEmpty ||
                                quizProvider.field2Controller.text.isEmpty ||
                                quizProvider.field3Controller.text.isEmpty ||
                                quizProvider.field4Controller.text.isEmpty ||
                                quizProvider.dropDown.text.isEmpty) {
                              errorSnackBar(context, "Please Enter all Fields");
                              return;
                            }

                            context.read<QuizProvider>().setQuiz(context, {
                              "questionTitle": quizProvider.questionTitle.text,
                              "option1": quizProvider.field1Controller.text,
                              "option2": quizProvider.field2Controller.text,
                              "option3": quizProvider.field3Controller.text,
                              "option4": quizProvider.field4Controller.text,
                              "dropDown": quizProvider.dropDown.text,
                              "dateTime": DateTime.now().toString()
                            });

                            quizProvider.clearTextField();
                          },
                          child: Text("Add New Quesion")),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
