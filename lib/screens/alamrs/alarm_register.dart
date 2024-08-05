import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_health_app/screens/home/home.dart';
import 'package:projeto_health_app/model/alarm.dart';
import 'package:projeto_health_app/repository/alarm_repository.dart';
import 'package:projeto_health_app/shared/custom_app_bar.dart';
import 'package:projeto_health_app/shared/custom_time_picker.dart';
import 'package:time_picker_wheel/time_picker_wheel.dart';

class Alarms extends StatefulWidget {
  const Alarms({super.key});
  @override
  State<Alarms> createState() => _Alarms();
}

class _Alarms extends State<Alarms> {
  late String hora;
  final medication = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("HealthApp"),
      backgroundColor: const Color.fromRGBO(213, 228, 247, 1),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: TimePicker(
                            onChange: (timeOfDay) {
                              setState(() {
                                hora = getFormatedTimeFromTimeOfDay(timeOfDay);
                              });
                            },
                            options: customTimePicker(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.fromLTRB(10, 6, 10, 0),
                          child: TextFormField(
                            validator: (value) => (value == "")
                                ? 'Insira o nome do remédio!!'
                                : null,
                            controller: medication,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Nome do remédio",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Actions(
                      actions: const {},
                      child: ElevatedButton(
                        onPressed: () {
                          {
                            Navigator.pushNamed(context, 'home');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize:const Size(168, 35)),
                        child: const Text(
                          "Cancelar",
                          style:
                              TextStyle(color: Color.fromRGBO(47, 98, 140, 1)),
                        ),
                      )),
                  Actions(
                      actions: const {},
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            saveAlarm();
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>const Home()),
                              ModalRoute.withName(
                                  '/'), // Remove todas as páginas até a página inicial
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(168, 35)),
                        child: const Text(
                          "Salvar",
                          style:
                               TextStyle(color: Color.fromRGBO(47, 98, 140, 1)),
                        ),
                      )),
                ],
              )
            ]),
      ),
    );
  }

  String getFormatedTimeFromTimeOfDay(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hourOfPeriod.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');

    String time = '$hour:$minute';

    log(time);

    return time;
  }

  void saveAlarm() async {
    final alarm = Alarm(alarmHour: hora, medicationName: medication.text);
    try {
      final id = await AlarmRepository.insert(alarm);
      var snackBar = null;
      if (id > 0) {
        snackBar = const SnackBar(content: Text('Alarme salvo com sucesso!!!'));
      } else {
        snackBar = const SnackBar(content: Text('Erro, favor verificar!!!'));
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (error) {
      print(error);
    }
  }
}
