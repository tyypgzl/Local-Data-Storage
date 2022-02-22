import 'package:flutter/material.dart';
import 'package:local_strorage/shared_preferences/shared_preferences_helper.dart';

class SharedPreferncesView extends StatefulWidget {
  const SharedPreferncesView({Key? key}) : super(key: key);

  @override
  State<SharedPreferncesView> createState() => _SharedPreferncesViewState();
}

class _SharedPreferncesViewState extends State<SharedPreferncesView> {
  late final SharedPreferencesHelper sharedPreferencesHelper;
  late final TextEditingController tfController;
  String data = '';

  @override
  void initState() {
    sharedPreferencesHelper = SharedPreferencesHelper.instance;
    tfController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: tfController,
          ),
          ElevatedButton(
            onPressed: () async {
              await sharedPreferencesHelper.setStringValue('name', tfController.text);
            },
            child: const Text('Save'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () {
              data = sharedPreferencesHelper.getStringValue('name') ?? '';
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
