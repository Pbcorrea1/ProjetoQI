import 'package:flutter/material.dart';
import 'package:projeto_health_app/model/alarm.dart';
import 'package:projeto_health_app/repository/alarm_repository.dart';

class NewAlarm extends StatelessWidget {
  final Alarm alarm;
  final int index;
  const NewAlarm({super.key, required this.alarm, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) async {
        final result = await AlarmRepository.remove(alarm.number!);
        SnackBar snackBar;
        if (result != 0) {
          snackBar =
              const SnackBar(content: Text('Alarme removido com sucesso'));
        } else {
          snackBar = const SnackBar(content: Text('Nada foi excluido'));
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.amber,
      ),
      key: Key(alarm.number.toString()),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Card(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    alarm.medicationName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    alarm.alarmHour,
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
