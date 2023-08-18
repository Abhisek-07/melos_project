import 'dart:io';

void nonWebSpecificAction() {
  File file = File('path_to_file.txt');
  print('Using dart:io for non-web platforms. ${file.path}');
}

void performPlatformSpecificAction() {
  nonWebSpecificAction();
}
