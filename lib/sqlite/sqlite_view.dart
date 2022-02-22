import 'package:flutter/material.dart';
import 'package:local_strorage/sqlite/sqflite_helper.dart';
import 'package:local_strorage/sqlite/student_model.dart';

class SQLiteView extends StatefulWidget {
  const SQLiteView({Key? key}) : super(key: key);

  @override
  _SQLiteViewState createState() => _SQLiteViewState();
}

class _SQLiteViewState extends State<SQLiteView> {
  SQLiteStudentHelper dbHelper = SQLiteStudentHelper.instance;
  final TextEditingController tfNameControler = TextEditingController();
  final TextEditingController tfSchoolNameControler = TextEditingController();
  final TextEditingController tfAgeControler = TextEditingController();
  Student? student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Name'),
                keyboardType: TextInputType.name,
                controller: tfNameControler,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'School Name'),
                keyboardType: TextInputType.name,
                controller: tfSchoolNameControler,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Age'),
                keyboardType: TextInputType.number,
                controller: tfAgeControler,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await dbHelper.insertStudent(
                        Student(
                          id: 1,
                          name: tfNameControler.text,
                          schoolName: tfSchoolNameControler.text,
                          age: int.parse(tfAgeControler.text),
                        ),
                      );
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Student is saved'),
                      ),
                    );
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final student = await dbHelper.getStudents();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(student.last.toString()),
                      ),
                    );
                  },
                  child: const Text('Read'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
