import 'dart:async';
import 'package:floor/floor.dart';
import 'package:local_strorage/floor/dao/employee_dao.dart';
import 'package:local_strorage/floor/model/employee_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'local_database.g.dart';

@Database(version: 1, entities: [Employee])
abstract class LocalDatabase extends FloorDatabase {
  EmployeeDao get employeeDao;
}
