import 'package:flutter/material.dart';
import 'package:governmentjobadmin/model/push_notification_model.dart';
import 'package:governmentjobadmin/providers/notification_provider.dart';
import 'package:provider/provider.dart';

import '../utils/custom_snackbar.dart';

class PushNotificationForm extends StatefulWidget {
  const PushNotificationForm({super.key});

  @override
  State<PushNotificationForm> createState() => _PushNotificationFormState();
}

class _PushNotificationFormState extends State<PushNotificationForm> {
  TextEditingController title=TextEditingController();
  TextEditingController body=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      labelText: 'title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter title for notifications';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: body,
                    decoration: InputDecoration(
                      labelText: 'body of notification',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter body for notification';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15,),
            context.watch<NotificationProvider>().isLoading?const Center(child: CircularProgressIndicator()):
            ElevatedButton(
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                    onPressed: () async{
                      if(title.text.isEmpty || body.text.isEmpty){
                        errorSnackBar(context, "PLease enter all fields");
                        return;
                      }

                      Map data=PushNotificationModel(to: "/topics/jobNotifications",notification: NotificationBody(title: title.text,body: body.text)).toJson();
                      
                      context.read<NotificationProvider>().sendPushNotification(data, context);
                      print("clciker");
                  }, child: Text("Send",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),),),
      ],
    );
  }
}