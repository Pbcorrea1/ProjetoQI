import 'package:projeto_health_app/model/alarm.dart';
import 'package:projeto_health_app/model/db_helper.dart';

class AlarmRepository {
  static Future<int> insert(Alarm alarms) async {
    final db = await DbHelper.openConnection();
    return db.insert('alarms', alarms.toMap());
  }

  static Future<List<Alarm>> findAll() async {
    final db = await DbHelper.openConnection();
    final result = await db.query('alarms');
    return result.map((item) => Alarm.fromMap(item)).toList();
  }

  static Future<int> remove(int number) async {
    final db = await DbHelper.openConnection();
    return await db.delete(
      'alarms',
      where: 'number = ?',
      whereArgs: [number],
    );
  }
}
