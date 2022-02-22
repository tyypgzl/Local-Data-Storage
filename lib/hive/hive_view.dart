import 'package:flutter/material.dart';
import 'package:local_strorage/hive/hive_helper.dart';

class HiveView extends StatefulWidget {
  const HiveView({Key? key}) : super(key: key);

  @override
  _HiveViewState createState() => _HiveViewState();
}

class _HiveViewState extends State<HiveView> {
  late final HiveHelper hiveHelper;
  late final TextEditingController tfController;
  String data = '';

  @override
  void initState() {
    hiveHelper = HiveHelper.instance;
    tfController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Storage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: tfController,
          ),
          ElevatedButton(
            onPressed: () async {
              var openedBox = await hiveHelper.hiveOpenBox<String>('names');
              hiveHelper.changeInitialBox(openedBox);
              hiveHelper.setStringValue('name', tfController.text);
            },
            child: const Text('Save'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              data = await hiveHelper.getStringValue('name');
              setState(() {});
            },
            child: const Text('Read'),
          ),
          Text('Readed Data: $data'),
        ],
      ),
    );
  }
}
