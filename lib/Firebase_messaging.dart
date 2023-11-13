import 'package:firebase_messaging/firebase_messaging.dart';
class message{
  Future fcm()async{
    final fcmToken =  await FirebaseMessaging.instance.getToken();
    print("Fcmtoken");
    print(fcmToken);
  }

}
