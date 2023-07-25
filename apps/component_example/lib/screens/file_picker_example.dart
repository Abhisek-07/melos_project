import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file_plus/open_file_plus.dart';
// import 'package:open_app_file/open_app_file.dart';

class FilePickerExample extends StatefulWidget {
  const FilePickerExample({super.key});

  @override
  State<FilePickerExample> createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  String filePath = '';
  PlatformFile? file;
  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.first;

      // file == null ? false : OpenFile.open(file?.path);
      setState(() {
        filePath = file?.path ?? 'No path found';
      });
      // OpenAppFile.open(file!.path.toString());
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 49, 168, 215),
                Color.fromARGB(255, 58, 207, 100)
              ])),
            ),
            title: const Text(
              'File Picker',
              style: TextStyle(
                  color: Color.fromARGB(255, 59, 54, 54),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
              ElevatedButton.icon(
                  onPressed: picksinglefile,
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 61, 186, 228))),
                  icon: const Icon(Icons.insert_drive_file_sharp),
                  label: const Text(
                    'Pick File',
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 16,
              ),
              Text(filePath),
            ])));
  }
}
