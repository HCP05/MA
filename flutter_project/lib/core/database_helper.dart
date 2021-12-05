import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'client_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'clients.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE clients(
          id INTEGER PRIMARY KEY,
          name TEXT,
          email TEXT,
          phoneNumber TEXT,
          adress TEXT,
          package TEXT
      )
      ''');
  }

  Future<List<Client>> getClients() async {
    Database db = await instance.database;
    var clients = await db.query('clients', orderBy: 'name');

    List<Client> clientList = clients.isNotEmpty
        ? clients.map((c) => Client.fromJson(c)).toList()
        : [];
    return clientList;
  }

  Future<int> add(Client client) async {
    Database db = await instance.database;
    return await db.insert('clients', client.toJson());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('clients', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Client client) async {
    Database db = await instance.database;
    return await db.update('clients', client.toJson(),
        where: 'id = ?', whereArgs: [client.id]);
  }
}
