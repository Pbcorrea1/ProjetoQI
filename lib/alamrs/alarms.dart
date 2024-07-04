import 'package:flutter/material.dart';
import 'package:projeto_health_app/shared/custom_app_bar.dart';

class Alarms extends StatefulWidget {
  const Alarms({super.key});
  @override
  State<Alarms> createState() => _Alarms();
  // TODO: implement createState
}

class _Alarms extends State<Alarms> {
  final entryTimeController =
      TextEditingController(text: _formatTime(TimeOfDay.now()));

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("HealthApp"),
      backgroundColor: Color.fromRGBO(213, 228, 247, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: entryTimeController,
              readOnly: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.schedule,
                    ),
                    onPressed: () async {
                      entryTimeController.text = await showTimeDialog();
                    }),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Nome do remédio"),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 160),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Actions(
                    actions: {},
                    child: ElevatedButton(
                      onPressed: () {
                        {
                          Navigator.pushNamed(context, 'home');
                        }
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Color.fromRGBO(47, 98, 140, 1)),
                      ),
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(168, 35)),
                    )),
                Actions(
                    actions: {},
                    child: ElevatedButton(
                      onPressed: () {
                        {
                          Navigator.pushNamed(context, 'home');
                        }
                      },
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Color.fromRGBO(47, 98, 140, 1)),
                      ),
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(168, 35)),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> showTimeDialog() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    return _formatTime(time!);
  }
}

String _formatTime(TimeOfDay time) =>
    "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
