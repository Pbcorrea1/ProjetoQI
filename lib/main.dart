import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projeto_health_app/alamrs/alarms.dart';
import 'package:projeto_health_app/configurations/configurations.dart';
import 'package:projeto_health_app/home/home.dart';
import 'package:projeto_health_app/notification/notifications.dart';
import 'package:projeto_health_app/theme.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o timezone
  tz.initializeTimeZones();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(MaterialApp(
    initialRoute: 'home',
    routes: {
      'home': (context) => Home(),
      'alarms': (context) => Alarms(),
      'configurations': (context) => Configurations(),
      'notifications': (context) => Notifications(),
    },
    theme: ThemeData(
      colorScheme: MaterialTheme.lightScheme(),
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.dark(),
    ),
  ));
}
