import 'package:dio/dio.dart';

class SendPushNotification{

static  Future<void> sendPushNotification(Map data)async{
    try {
     var resp=  await Dio().post("https://fcm.googleapis.com/fcm/send",
    data: data,options: Options(headers: {
      "Authorization":"key=AAAA_uWe47Y:APA91bE-mfK36eASKDyzHO5UugcCy_SJfKGB9FqqDovwSLM_hY5m6EBJYqn9eT6pXM1rOEoSQzHBBB_EwFlhPuLFlglopQAFbyWwldpA88RbP51HK3nbIXA5Y9INgmk6zVbbbORZjWHD",
      "Content-Type":"application/json"
    })
    );

    print(resp.data);
    } catch (e) {
      rethrow;
    }
  }
}