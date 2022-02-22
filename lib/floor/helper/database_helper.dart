import 'package:flutter/material.dart';
import 'package:local_strorage/floor/database/local_database.dart';

class LocalDatabaseHelper {
  static LocalDatabaseHelper? _instance;

  static LocalDatabaseHelper get instance => _instance ??= LocalDatabaseHelper._init();

  LocalDatabase? localDatabase;
  final String _dbName = 'local.db';

  LocalDatabaseHelper._init() {
    _initFloorDb();
  }

  Future<void> _initFloorDb() async {
    localDatabase = await $FloorLocalDatabase.databaseBuilder(_dbName).build();
    debugPrint('Database Created');
  }
}
