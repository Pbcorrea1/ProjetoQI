import 'package:time_picker_wheel/time_picker_wheel.dart';
import 'package:flutter/material.dart';

TimePicker CustomTime() {
  return TimePicker(
    onChange: (timeOfDay) {},
    options: TimePickerOptions.byDefault(
      height: 154,
      itemExtent: 30,
      diameterRatio: 1,
      selectedRowHeight: 50,
      fontOpacity: 1,
      fontColor: const Color.fromARGB(255, 0, 0, 0),
      labelSize: 25,
      numberSize: 25,
      amPmSize: 15,
      amPmWidth: 25,
      wheelWidth: 50,
      selectedRowHorizontalPadding: double.maxFinite,
      selectedRowHorizontalBorderRadius: 1,
      selectedRowBackgroundColor: Color(4292207863),
      selectedRowForegroundColor: Color(4281361036),
    ),
  );
}
