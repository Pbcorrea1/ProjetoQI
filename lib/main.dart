import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projeto_health_app/screens/alamrs/alarm_register.dart';
import 'package:projeto_health_app/screens/configurations/configurations.dart';
import 'package:projeto_health_app/screens/home/home.dart';
import 'package:projeto_health_app/notification/notifications.dart';
import 'package:projeto_health_app/theme.dart';
import 'package:timezone/data/latest_all.dart' as tz;

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
      'home': (context) => const Home(),
      'alarms': (context) => const Alarms(),
      'configurations': (context) => Configurations(),
      'notifications': (context) => Notifications(),
    },
    theme: ThemeData(
      colorScheme: MaterialTheme.lightScheme(),
    ),
    darkTheme: ThemeData(
      colorScheme: const ColorScheme.dark(),
    ),
  ));
}
