// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorLocalDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LocalDatabaseBuilder databaseBuilder(String name) => _$LocalDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LocalDatabaseBuilder inMemoryDatabaseBuilder() => _$LocalDatabaseBuilder(null);
}

class _$LocalDatabaseBuilder {
  _$LocalDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$LocalDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$LocalDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<LocalDatabase> build() async {
    final path = name != null ? await sqfliteDatabaseFactory.getDatabasePath(name!) : ':memory:';
    final database = _$LocalDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$LocalDatabase extends LocalDatabase {
  _$LocalDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EmployeeDao? _employeeDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations, [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database
            .execute('CREATE TABLE IF NOT EXISTS `Employee` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `genderIndex` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EmployeeDao get employeeDao {
    return _employeeDaoInstance ??= _$EmployeeDao(database, changeListener);
  }
}

class _$EmployeeDao extends EmployeeDao {
  _$EmployeeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _employeeInsertionAdapter =
            InsertionAdapter(database, 'Employee', (Employee item) => <String, Object?>{'id': item.id, 'name': item.name, 'genderIndex': item.genderIndex}),
        _employeeUpdateAdapter = UpdateAdapter(
            database, 'Employee', ['id'], (Employee item) => <String, Object?>{'id': item.id, 'name': item.name, 'genderIndex': item.genderIndex}),
        _employeeDeletionAdapter = DeletionAdapter(
            database, 'Employee', ['id'], (Employee item) => <String, Object?>{'id': item.id, 'name': item.name, 'genderIndex': item.genderIndex});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Employee> _employeeInsertionAdapter;

  final UpdateAdapter<Employee> _employeeUpdateAdapter;

  final DeletionAdapter<Employee> _employeeDeletionAdapter;

  @override
  Future<Employee?> findEmployee(int id) async {
    return _queryAdapter.query('SELECT * FROM Employee WHERE id= ?1',
        mapper: (Map<String, Object?> row) => Employee(id: row['id'] as int?, name: row['name'] as String, genderIndex: row['genderIndex'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Employee>?> findAllEmployee() async {
    return _queryAdapter.queryList('SELECT * FROM Employee',
        mapper: (Map<String, Object?> row) => Employee(id: row['id'] as int?, name: row['name'] as String, genderIndex: row['genderIndex'] as int));
  }

  @override
  Future<void> deleteAllEmployee() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Employee');
  }

  @override
  Future<void> insertEmployee(Employee employee) async {
    await _employeeInsertionAdapter.insert(employee, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertEmployees(List<Employee> employees) async {
    await _employeeInsertionAdapter.insertList(employees, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateEmployee(Employee employee) async {
    await _employeeUpdateAdapter.update(employee, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteEmployee(Employee employee) async {
    await _employeeDeletionAdapter.delete(employee);
  }

  @override
  Future<void> deleteEmployees(List<Employee> employees) async {
    await _employeeDeletionAdapter.deleteList(employees);
  }
}
