import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'contact.dart';

///
/// @author
/// @version
void main() async {
  List<Contact> list = await getContacts();
  print(list);
}

Future<void> insertContact(Contact contact) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts1_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts1(id INTEGER PRIMARY KEY, name TEXT, occupation TEXT, phone TEXT, email TEXT, address TEXT, website TEXT)');
    },
    version: 1,
  );

  final db = await database;
  await db.insert('contacts1', contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

///
Future<List<Contact>> getContacts() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts1_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts1(id INTEGER PRIMARY KEY, name TEXT, occupation TEXT, phone TEXT, email TEXT, address TEXT, website TEXT)');
    },
    version: 1,
  );
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query("contacts1");
  return List.generate(maps.length, (i) {
    return Contact(
      maps[i]['name'],
      maps[i]['occupation'],
      maps[i]['phone'],
      maps[i]['email'],
      maps[i]['address'],
      maps[i]['website'],
      maps[i]['id'],
    );
  });
}

///
Future<void> updateContact(Contact contact) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts1_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts1(id INTEGER PRIMARY KEY, name TEXT, occupation TEXT, phone TEXT, email TEXT, address TEXT, website TEXT)');
    },
    version: 1,
  );
  final db = await database;

  await db.update(
    'contacts1',
    contact.toMap(),
    where: 'id = ?',
    whereArgs: [contact.id],
  );
}

///
Future<void> deleteContact(int id) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts1_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts1(id INTEGER PRIMARY KEY, name TEXT, occupation TEXT, phone TEXT, email TEXT, address TEXT, website TEXT)');
    },
    version: 1,
  );
  final db = await database;
  await db.delete(
    'contacts1',
    where: 'id = ?',
    whereArgs: [id],
  );
}
