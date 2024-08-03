import 'package:flutter/material.dart';
import 'package:projeto_health_app/home/components/new_alarm.dart';
import 'package:projeto_health_app/repository/alarm_repository.dart';
import 'package:projeto_health_app/shared/custom_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(213, 228, 247, 1),
        appBar: customAppBar("HealthApp"),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Actions(
                    actions: {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            onPressed: () =>
                                {Navigator.pushNamed(context, 'alarms')},
                            icon: Icon(Icons.add),
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)))),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(0, 29, 50, 1))),
                          ),
                          PopupMenuButton(
                              padding: EdgeInsets.all(10),
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14)))),
                                  iconColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color.fromRGBO(0, 29, 50, 1))),
                              itemBuilder: (Context) => [
                                    PopupMenuItem(
                                      child: Text("Configurações"),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, 'configurations');
                                      },
                                    )
                                  ])
                        ],
                      ),
                    )),
              ],
            ),
            FutureBuilder(
                future: AlarmRepository.findAll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Nao existe dados'),
                    );
                  }
                  var listaDeAlarmes = snapshot.data!;
                  return RefreshIndicator(
                      onRefresh: () async {
                        listaDeAlarmes = await AlarmRepository.findAll();
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            height: 300,
                            child: Expanded(
                                child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: listaDeAlarmes.length,
                              itemBuilder: (context, index) => NewAlarm(
                                  alarm: listaDeAlarmes[index], index: index),
                            )),
                          )
                        ]),
                      ));
                }),
          ],
        ));
  }
}
