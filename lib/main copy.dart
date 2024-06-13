import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_selector/file_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _scaleFactor = 1.0;
  XFile? _imageFile;

  void _openImageFile() async {
    _imageFile = await openFile(acceptedTypeGroups: [
      XTypeGroup(label: 'images', extensions: ['jpg', 'png'])
    ]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Resizer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_imageFile != null)
              Image.file(
                File(_imageFile!.path),
                width: 200 * _scaleFactor,
                height: 200 * _scaleFactor,
              ),
            Slider(
              value: _scaleFactor,
              min: 0.1,
              max: 2.0,
              onChanged: (double value) {
                setState(() {
                  _scaleFactor = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: _openImageFile,
              child: const Text('Open Image'),
            ),
          ],
        ),
      ),
    );
  }
}
