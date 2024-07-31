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
      alarmHour: 'alarmHour' as String,
      medicationName: 'medicationName' as String);
}
