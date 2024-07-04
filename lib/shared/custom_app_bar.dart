import 'package:flutter/material.dart';

AppBar customAppBar(String title) {
  return AppBar(
    backgroundColor: Color.fromRGBO(213, 228, 247, 1),
    toolbarHeight: 200,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 30,
        color: Color.fromRGBO(0, 0, 0, 1),
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      ),
    ),
  );
}
