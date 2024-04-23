import 'package:flutter/material.dart';
//import 'package:mr_garage/view/auth/landing.view.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:mr_garage/view/pelanggan/navbar/pelanggan_navbar.dart';

void main() async {
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'mr-garage_channel_group',
        channelKey: 'mr-garage_channel',
        channelName: 'Notifikasi Mr.Garage',
        channelDescription: 'Notifikasi untuk Mr.Garage',
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'mr-garage_channel_group', channelGroupName: 'Mr.Garage group')
    ],
  );
  bool isAllowedToSendNotification = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: PelangganNavBar());
  }
}
