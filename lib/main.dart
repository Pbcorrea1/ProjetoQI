import 'package:flutter/material.dart';
import 'package:projeto_health_app/alamrs/alarms.dart';
import 'package:projeto_health_app/configurations/configurations.dart';
import 'package:projeto_health_app/home/home.dart';
import 'package:projeto_health_app/theme.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    routes: {'home': (context) => Home(), 'alarms': (context) => Alarms(), 'configurations': (context) => Configurations()},
    theme: ThemeData(
      colorScheme: MaterialTheme.lightScheme(),
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.dark(),
    ),
  ));
}
