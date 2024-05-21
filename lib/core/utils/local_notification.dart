import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();

  static onTap(NotificationResponse notificationResponse) {}
  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static void showSchduledNotification(
      {required String notificationTitle,
      required String notificationDesc,
      required int month,
      required int day,
      required int hour,
      required int min}) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 3', 'channelName',
            importance: Importance.max, priority: Priority.high));
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        notificationTitle,
        notificationDesc,
        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        tz.TZDateTime(tz.local, 2024, month, day, hour, min),
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static void showSimpleNotification() async {
    NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails(
      'id 1',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('note5.wav'.split('.').first),
    ));
    await flutterLocalNotificationsPlugin.show(
        0, 'Simple Notification', 'First notification ', details,
        payload: 'payload data');
  }

  static void showRepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 2', 'channelName',
            importance: Importance.max, priority: Priority.high));

    await flutterLocalNotificationsPlugin.periodicallyShow(
        1,
        'Repeated Notification',
        'Second notification ',
        RepeatInterval.everyMinute,
        details,
        payload: 'payload data');
  }
}
