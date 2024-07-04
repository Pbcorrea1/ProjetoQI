import 'package:flutter/material.dart';
import 'package:projeto_health_app/shared/custom_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(213, 228, 247, 1),
      appBar: customAppBar("HealthApp"),
      body: Row(
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
                      onPressed: () => {Navigator.pushNamed(context, 'alarms')},
                      icon: Icon(Icons.add),
                      style: const ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)))),
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(0, 29, 50, 1))),
                    ),
                    PopupMenuButton(
                        padding: EdgeInsets.all(10),
                        style: const ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)))),
                            iconColor: WidgetStatePropertyAll(Colors.white),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(0, 29, 50, 1))),
                        itemBuilder: (Context) =>
                            [const PopupMenuItem(child: Text("Configurações"))])
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
