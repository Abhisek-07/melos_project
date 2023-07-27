import 'package:component_example/providers/theme_provider.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:io' as io;
import 'file_operation.dart'
    if (dart.library.html) 'file_operations_web.dart'
    if (dart.library.io) 'file_operations_io.dart';
// import 'dart:html' as html;

// import 'package:file_picker/file_picker.dart';

class FilePickerExample extends ConsumerWidget {
  const FilePickerExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeNotifier themeNotifier = ref.watch(themeProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'File Picker', appTheme: themeNotifier.theme),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the platform-specific function
            // ignore: undefined_function
            performPlatformSpecificAction();
          },
          child: const Text('Perform Action'),
        ),
      ),
    );
  }
}
  // void performPlatformSpecificAction() {
  //   if (kIsWeb) {
  //     // Use dart:html for web platforms
  //     webSpecificAction();
  //   } else {
  //     // Use dart:io for non-web platforms
  //     nonWebSpecificAction();
  //   }
  // }

//   // Function that uses dart:io for non-web platforms
//   void nonWebSpecificAction() {
//     io.File file = io.File('path_to_file.txt');
//     print('Using dart:io for non-web platforms. ${file.path}');
//   }

//   // Function that uses dart:html for web platforms
//   void webSpecificAction() {
//     html.File file = html.File([], 'path_to_file.txt');
//     print('Using dart:html for web platforms. ${file.name}');
//   }
// }












// class FilePickerExample extends StatefulWidget {
//   const FilePickerExample({super.key});

//   @override
//   State<FilePickerExample> createState() => _FilePickerExampleState();
// }

// class _FilePickerExampleState extends State<FilePickerExample> {
//   String filePath = '';
//   PlatformFile? file;
//   Future<void> picksinglefile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       file = result.files.first;

//       // file == null ? false : OpenFile.open(file?.path);
//       setState(() {
//         filePath = file?.path ?? 'No path found';
//       });
//       // OpenAppFile.open(file!.path.toString());
//     }
//   }

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Color.fromARGB(255, 49, 168, 215),
//                 Color.fromARGB(255, 58, 207, 100)
//               ])),
//             ),
//             title: const Text(
//               'File Picker',
//               style: TextStyle(
//                   color: Color.fromARGB(255, 59, 54, 54),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25),
//             )),
//         body: Center(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//               ElevatedButton.icon(
//                   onPressed: picksinglefile,
//                   style: const ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(
//                           Color.fromARGB(255, 61, 186, 228))),
//                   icon: const Icon(Icons.insert_drive_file_sharp),
//                   label: const Text(
//                     'Pick File',
//                     style: TextStyle(fontSize: 25),
//                   )),
//               const SizedBox(
//                 height: 16,
//               ),
//               Text(filePath),
//             ])));
//   }
// }
