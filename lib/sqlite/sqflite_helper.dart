import 'dart:async';
import 'package:local_strorage/sqlite/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteStudentHelper {
  static SQLiteStudentHelper? _instance;

  static SQLiteStudentHelper get instance => _instance ??= SQLiteStudentHelper._init();

  SQLiteStudentHelper._init() {
    _initDb();
  }

  late final Database _database;
  final String _tableName = 'Student';
  final String _dbName = 'school.db';
  final String _studentIdColumn = 'id';
  final String _studentNameColumn = 'name';
  final String _studentSchoolNameColumn = 'schoolName';
  final String _studentAgeColumn = 'age';

  Future<void> _initDb() async {
    _database = await _openDb();
  }

  Future<Database> _openDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: 1,
      onCreate: _oncreate,
    );
  }

  Future<void> _oncreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_tableName ($_studentIdColumn INTEGER PRIMARY KEY, $_studentNameColumn TEXT, $_studentSchoolNameColumn TEXT, $_studentAgeColumn INTEGER)');
  }

  Future<List<Student>> getStudents() async {
    final result = await _database.query('Student');
    return result.map((e) => Student.fromMap(e)).toList();
  }

  Future<int> insertStudent(Student student) async {
    return await _database.insert(_tableName, student.toMap());
  }

  Future<int> updateStudent(Student student) async {
    return await _database.update(_tableName, student.toMap(), where: 'id=?', whereArgs: [student.id]);
  }

  Future<int> deleteStudent(int id) async {
    return await _database.rawDelete('delete from $_tableName where id =$id');
  }
}
