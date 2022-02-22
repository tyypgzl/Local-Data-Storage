import 'package:flutter/material.dart';
import 'package:local_strorage/floor/helper/database_helper.dart';
import 'package:local_strorage/floor/model/employee_model.dart';

class FloorView extends StatefulWidget {
  const FloorView({Key? key}) : super(key: key);

  @override
  _FloorViewState createState() => _FloorViewState();
}

class _FloorViewState extends State<FloorView> {
  List<Employee> employeeList = [];
  final textController = TextEditingController();
  bool switchValue = true; //true->female false->male
  final db = LocalDatabaseHelper.instance.localDatabase;

  @override
  void initState() {
    getEmployee();

    super.initState();
  }

  Future<void> getEmployee() async {
    employeeList = await db?.employeeDao.findAllEmployee() ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floor'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Male'),
              Switch(
                value: switchValue,
                activeColor: Colors.blueGrey,
                overlayColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                activeTrackColor: Colors.blue,
                inactiveThumbColor: Colors.blueGrey,
                inactiveTrackColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
              const Text('Female'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await db?.employeeDao.insertEmployee(
                      Employee(
                          name: textController.text,
                          gender: switchValue ? Gender.female : Gender.male,
                          genderIndex: switchValue ? Gender.female.index : Gender.male.index),
                    );
                  },
                  child: const Text('Save'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      await getEmployee();
                      setState(() {});
                    },
                    child: const Text('Read')),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: employeeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(employeeList[index].name ?? ''),
                  subtitle: Text(Gender.values[employeeList[index].genderIndex ?? 0].name),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
