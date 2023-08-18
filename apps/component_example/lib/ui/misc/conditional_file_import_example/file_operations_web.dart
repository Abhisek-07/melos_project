import 'dart:html';

void webSpecificAction() {
  File file = File([], 'path_to_file.txt');
  print('Using dart:html for web platforms. ${file.size}');
}

void performPlatformSpecificAction() {
  webSpecificAction();
}
