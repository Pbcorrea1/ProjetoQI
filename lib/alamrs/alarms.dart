import 'package:flutter/material.dart';
import 'package:projeto_health_app/shared/custom_app_bar.dart';
import 'package:time_picker_wheel/time_picker_wheel.dart';

class Alarms extends StatefulWidget {
  const Alarms({super.key});
  @override
  State<Alarms> createState() => _Alarms();
  // TODO: implement createState
}

class _Alarms extends State<Alarms> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("HealthApp"),
      backgroundColor: Color.fromRGBO(213, 228, 247, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Form(
                    child: Column(
                      children: [
                        TimePicker(
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
                        ),
                        SizedBox(
                          height: 32,
                        ),
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
}
