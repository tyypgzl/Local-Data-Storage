import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderView extends StatefulWidget {
  const PathProviderView({Key? key}) : super(key: key);

  @override
  State<PathProviderView> createState() => _PathProviderViewState();
}

class _PathProviderViewState extends State<PathProviderView> {
  final TextEditingController textController = TextEditingController();

  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textController,
          ),
          ElevatedButton(
            onPressed: writeData,
            child: const Text('Write'),
          ),
          ElevatedButton(
            onPressed: readData,
            child: const Text('Read'),
          ),
          Text(data),
        ],
      ),
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<void> readData() async {
    try {
      final file = await _localFile;
      data = await file.readAsString();
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> writeData() async {
    try {
      final file = await _localFile;
      await file.writeAsString(textController.text);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
