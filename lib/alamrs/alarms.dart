import 'package:flutter/material.dart';
import 'package:projeto_health_app/shared/custom_app_bar.dart';
import 'package:projeto_health_app/shared/custom_time.dart';

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
        padding: const EdgeInsets.all(6.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Expanded(
                  child: Form(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(10),
                          child: CustomTime(),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.fromLTRB(10, 6, 10, 0),
                          child: TextFormField(
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
                      actions: {},
                      child: ElevatedButton(
                        onPressed: () {
                          {
                            Navigator.pushNamed(context, 'home');
                          }
                        },
                        child: Text(
                          "Cancelar",
                          style:
                              TextStyle(color: Color.fromRGBO(47, 98, 140, 1)),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(168, 35)),
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
                          style:
                              TextStyle(color: Color.fromRGBO(47, 98, 140, 1)),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(168, 35)),
                      )),
                ],
              )
            ]),
      ),
    );
  }
}
