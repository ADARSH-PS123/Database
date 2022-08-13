import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

late Database db;
ValueNotifier<List<ModelClass>> ls = ValueNotifier([]);

void addData(ModelClass ob) async {
  ls.value.add(ob);
  await insertData(ob.name, ob.age);
  ls.notifyListeners();
}

void removeData() async {
  await removeItemFromdb(await count());
  ls.value.isNotEmpty ? ls.value.removeLast() : null;
}

Future<void> openBase() async {
  db = await openDatabase("content://com.android.externalstorage.documents/document/0B0C-310A%3Adata", version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
  });
}

Future<void> insertData(String names, String ages) async {
  await db.transaction((txn) async {
    await txn
        .rawInsert('INSERT INTO Test(name, age) VALUES(?,?)', [names, ages]);
  });
}

Future readDatabase() async {
  final list = await db.rawQuery('SELECT * FROM Test');
  list.forEach((element) {
    ls.value.add(ModelClass.fromMap(element));
  });
}

Future<void> removeItemFromdb(int id) async {
  await db.rawDelete('DELETE FROM Test WHERE id=?', [id]);
  ls.notifyListeners();
}

Future<int> count() async {
  int? count =
      Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Test'));
  print(count);
  return count as int;
}
