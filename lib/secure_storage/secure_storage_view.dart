import 'package:flutter/material.dart';
import 'package:local_strorage/secure_storage/secure_storage_helper.dart';

class SecureStorageView extends StatefulWidget {
  const SecureStorageView({Key? key}) : super(key: key);

  @override
  _SecureStorageViewState createState() => _SecureStorageViewState();
}

class _SecureStorageViewState extends State<SecureStorageView> {
  late final SecureStorageHelper secureStorageHelper;
  late final TextEditingController tfController;
  String data = '';
  @override
  void initState() {
    secureStorageHelper = SecureStorageHelper.instance;
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
            onPressed: () {
              secureStorageHelper.writeData('name', tfController.text);
            },
            child: const Text('Save'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              data = await secureStorageHelper.readData('name') ?? '';
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
