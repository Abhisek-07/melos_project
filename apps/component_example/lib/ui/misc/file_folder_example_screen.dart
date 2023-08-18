import 'package:component_example/providers/theme_provider.dart';
import 'package:component_example/ui/misc/widgets/add_modal_item.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utils/utils.dart';

class FileFolderScreen extends ConsumerStatefulWidget {
  const FileFolderScreen({super.key});

  @override
  ConsumerState<FileFolderScreen> createState() => _FileFolderScreenState();
}

class _FileFolderScreenState extends ConsumerState<FileFolderScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddItemModal(
                    onAddFile: (fileName) {
                      print(fileName);
                    },
                    onAddFolder: (fileName) {
                      print('$fileName - folder');
                    },
                  );
                },
              );
            },
            child: const Icon(
              Icons.add,
              size: spacing32,
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(
          // backIconColor: themeNotifier.theme.appDefaults.grayScaleWhite,
          // titleStyle: themeNotifier.theme.textStyles.headings.h5
          //     .copyWith(color: themeNotifier.theme.appDefaults.grayScaleWhite),
          // gradientColors: themeNotifier.theme.appDefaults.gradientPrime1,
          // backgroundColor: Colors.red,
          title: 'Files and Folders',
          appTheme: theme),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}


/// TEST






// class DataManager {
//   final List<Folder> rootFolders = [];
//   String currentFolderPath = '/';

//   void createNewFolder(String folderName, String parentFolderPath) {
//     final parentFolder = findFolderByPath(parentFolderPath, rootFolders);
//     if (parentFolder != null) {
//       final newFolder = Folder(name: folderName, subfolders: [], files: []);
//       parentFolder.subfolders.add(newFolder);
//     }
//   }

//   void addFileToFolder(String folderName, String filePath, File newFile) {
//     final folder = findFolderByPath(filePath, rootFolders);
//     if (folder != null && folder.name == folderName) {
//       folder.files.add(newFile);
//     }
//   }

//   Folder? findFolderByPath(String folderPath, List<Folder> folders) {
//     final parts = folderPath.split('/').where((part) => part.isNotEmpty).toList();
//     Folder? currentFolder;
//     for (final part in parts) {
//       if (currentFolder == null) {
//         currentFolder = folders.firstWhere((folder) => folder.name == part);
//       } else {
//         currentFolder =
//             currentFolder.subfolders.firstWhere((folder) => folder.name == part);
//       }
//     }
//     return currentFolder;
//   }
// }

// class MyApp extends StatelessWidget {
//   final DataManager dataManager = DataManager();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: GoRouter(
//         router,
//         onNotFound: (path) => NotFound(),
//       ),
//       routeInformationParser: GoRouterInformationParser(),
//     );
//   }

//   void addFolderRoute(String folderName) {
//     final folderRoute = createFolderRoute(folderName);
//     GoRouter.of(context).add(folderRoute);
//   }
// }

// Widget createFolderScreen(String folderName) {
//   return FolderScreen(folderName: folderName);
// }

// GoRoute createFolderRoute(String folderName) {
//   return GoRoute(
//     path: '/folder/$folderName',
//     builder: (context, state) => createFolderScreen(folderName),
//   );
// }

// class FoldersListScreen extends StatelessWidget {
//   final DataManager dataManager = DataManager();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Folders')),
//       body: ListView.builder(
//         itemCount: dataManager.rootFolders.length,
//         itemBuilder: (context, index) {
//           final folder = dataManager.rootFolders[index];
//           return ListTile(
//             title: Text(folder.name),
//             onTap: () {
//               GoRouter.of(context).go('/folder/${folder.name}');
//               dataManager.currentFolderPath = '/${folder.name}';
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) => AddItemModal(
//               onAddFolder: (folderName) {
//                 dataManager.createNewFolder(folderName, dataManager.currentFolderPath);
//                 MyApp.of(context).addFolderRoute(folderName);
//                 GoRouter.of(context).go('/folder/$folderName');
//               },
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class FolderScreen extends StatelessWidget {
//   final String folderName;
//   final DataManager dataManager = DataManager();

//   FolderScreen({required this.folderName});

//   @override
//   Widget build(BuildContext context) {
//     final folder = dataManager.findFolderByPath(dataManager.currentFolderPath, dataManager.rootFolders);
//     return Scaffold(
//       appBar: AppBar(title: Text(folderName)),
//       body: ListView.builder(
//         itemCount: folder?.files.length ?? 0,
//         itemBuilder: (context, index) {
//           final file = folder!.files[index];
//           return ListTile(
//             title: Text(file.name),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) => AddItemModal(
//               onAddFile: (fileName) {
//                 dataManager.addFileToFolder(folderName, dataManager.currentFolderPath, File(name: fileName));
//                 GoRouter.refresh(context);
//               },
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

