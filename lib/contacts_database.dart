import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'contact.dart';

/// TODO: fill this out
/// @author
/// @version
void main() async {
  List<Contact> list = await getContacts();
  //insertContact(Contact('fa', 'fa', 'la', 'oa', 'pa', 'ea', 'aa', 'wa', 'na', 22));
  print(list);
}

/// TODO: fill this out
Future<void> insertContact(Contact contact) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts321_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts321(id INTEGER PRIMARY KEY, fullName TEXT, firstName TEXT, lastName TEXT, occupation TEXT, phone TEXT, email TEXT, address TEXT, website TEXT, notes TEXT)');
    },
    version: 1,
  );

  final db = await database;
  await db.insert('contacts321', contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

/// TODO: fill this out
Future<List<Contact>> getContacts() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts321_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts321(id INTEGER PRIMARY KEY, fullName TEXT, firstName TEXT, lastName TEXT, occupation TEXT, phone TEXT, email TEXT, address TEXT, website TEXT, notes TEXT)');
    },
    version: 1,
  );
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query("contacts321");
  return List.generate(maps.length, (i) {
    return Contact(
      maps[i]['fullName'],
      maps[i]['firstName'],
      maps[i]['lastName'],
      maps[i]['occupation'],
      maps[i]['phone'],
      maps[i]['email'],
      maps[i]['address'],
      maps[i]['website'],
      maps[i]['notes'],
      maps[i]['id'],
    );
  });
}

/// TODO: fill this out
Future<void> updateContact(Contact contact) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts321_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts321(id INTEGER PRIMARY KEY, fullName TEXT, firstName TEXT, lastName TEXT, occupation TEXT, phone TEXT, email TEXT, address TEXT, website TEXT, notes TEXT)');
    },
    version: 1,
  );
  final db = await database;

  await db.update(
    'contacts321',
    contact.toMap(),
    where: 'id = ?',
    whereArgs: [contact.id],
  );
}

/// TODO: fill this out
Future<void> deleteContact(int id) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts321_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts321(id INTEGER PRIMARY KEY, fullName TEXT, firstName TEXT, lastName TEXT, occupation TEXT, phone TEXT, email TEXT, address TEXT, website TEXT, notes TEXT)');
    },
    version: 1,
  );
  final db = await database;
  await db.delete(
    'contacts321',
    where: 'id = ?',
    whereArgs: [id],
  );
}
