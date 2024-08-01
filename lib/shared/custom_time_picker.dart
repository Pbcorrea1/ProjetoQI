import 'package:flutter/material.dart';
import 'package:time_picker_wheel/time_picker_wheel.dart';

TimePickerOptions customTimePicker() {
  return TimePickerOptions(
      height: 160,
      fontColor: Colors.black,
      fontOpacity: 1,
      itemExtent: 50,
      diameterRatio: 50,
      numberSize: 30,
      labelSize: 30,
      wheelWidth: 50,
      amPmSize: 15,
      amPmWidth: 15,
      selectedRowHeight: 40,
      selectedRowBackgroundColor: Color(4288465915),
      selectedRowForegroundColor: Colors.black,
      selectedRowHorizontalPadding: 50,
      selectedRowHorizontalBorderRadius: 5);
}
