import 'package:flutter/material.dart';
import 'package:projeto_health_app/shared/custom_app_bar.dart';

class Configurations extends StatefulWidget {
  Configurations({super.key});

  @override
  State<Configurations> createState() => _ConfigurationsState();
}

class _ConfigurationsState extends State<Configurations> {
  var switchRememberAccess = true;
  var switch_two_factor_auth = false;
  var switch_notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(213, 228, 247, 1),
      appBar: customAppBar('Configurações'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Switch(
                    value: switch_notifications,
                    onChanged: (isActive) {
                      setState(() {
                        switch_notifications = isActive;
                      });
                    }),
                Text('Notificações')
              ],
            )
          ],
        ),
      ),
    );
  }
}
