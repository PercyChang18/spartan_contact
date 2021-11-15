import 'dart:async';

import 'package:flutter/widgets.dart';
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
        maps[i]['name'],
        maps[i]['phone'],
        maps[i]['email'],
        maps[i]['id'],
      );
    });
  }

  Future<void> updateContact(Contact contact) async {
    final db = await database;

    await db.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  print(await contacts());
}
