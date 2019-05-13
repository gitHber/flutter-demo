import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FileOperationPage extends StatefulWidget {
  FileOperationPage({Key key}) : super(key: key);

  @override
  FileOperationState createState() => FileOperationState();
}

class FileOperationState extends State<FileOperationPage> {
  int counter;
  @override
  void initState() {
    super.initState();
    readCounter().then((int value) {
      setState(() {
        counter = value;
      });
    });
  }

  // 获取本地文件
  Future<File> getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  // 读取counter
  Future<int> readCounter() async {
    try {
      File file = await getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> increment() async {
    setState(() {
      counter++;
    });
    await (await getLocalFile()).writeAsString('$counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地存储计数器'),
      ),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
