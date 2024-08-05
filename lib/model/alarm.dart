class Alarm {
  int? number;
  final String alarmHour;
  final String medicationName;

  Alarm({this.number, required this.alarmHour, required this.medicationName});

  Map<String, Object?> toMap() => {
        'number': number,
        'alarmHour': alarmHour,
        'medicationName': medicationName
      };

  factory Alarm.fromMap(Map<String, Object?> map) => Alarm(
      number: map['number'] as int?,
      alarmHour: map['alarmHour'] as String,
      medicationName: map['medicationName'] as String);
}
