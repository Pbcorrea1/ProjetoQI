import 'package:flutter/material.dart';
import 'package:projeto_health_app/alamrs/alarms.dart';
import 'package:projeto_health_app/home/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    routes: {'home': (context) => Home(), 
    'alarms': (context) => Alarms()},
  ));
}
