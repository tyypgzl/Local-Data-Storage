import 'package:flutter/material.dart';
import 'package:local_strorage/floor/helper/database_helper.dart';
import 'package:local_strorage/floor/view/floor_view.dart';
import 'package:local_strorage/hive/hive_view.dart';
import 'package:local_strorage/path_provider/path_prvider.dart';
import 'package:local_strorage/secure_storage/secure_storage_view.dart';
import 'package:local_strorage/shared_preferences/shared_preferences_view.dart';
import 'package:local_strorage/sqlite/sqlite_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDatabaseHelper.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fsc App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
      home: const WaitingView(),
    );
  }
}

class WaitingView extends StatelessWidget {
  const WaitingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PathProviderView(),
                ),
              );
            },
            child: const Text('Path Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SharedPreferncesView(),
                ),
              );
            },
            child: const Text('Shared Preferences'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecureStorageView(),
                ),
              );
            },
            child: const Text('Secure Storage'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HiveView(),
                ),
              );
            },
            child: const Text('Hive'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SQLiteView(),
                ),
              );
            },
            child: const Text('SQLite'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FloorView(),
                ),
              );
            },
            child: const Text('Floor'),
          ),
        ],
      ),
    );
  }
}
