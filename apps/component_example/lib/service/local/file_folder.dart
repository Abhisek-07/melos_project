class Folder {
  final String name;
  final List<Folder> subfolders;
  final List<File> files;

  Folder({required this.name, required this.subfolders, required this.files});
}

class File {
  final String name;

  File({required this.name});
}
