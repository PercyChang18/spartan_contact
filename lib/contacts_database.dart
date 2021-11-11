import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'contact.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts_database.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE contacts(id INTEGER PRIMARY KEY, '
          'name TEXT, phone TEXT, email TEXT)');
    },
    version: 1,
  );

  Future<void> insertContact(Contact contact) async {
    final db = await database;
    await db.insert('contacts', contact.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Contact>> contacts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query("contacts");

    return List.generate(maps.length, (i) {
      return Contact(
        name: maps[i]['name'],
        phone: maps[i]['phone'],
        email: maps[i]['email'],
        id: maps[i]['id'],
      );
    });
  }

  print(await contacts());
}
