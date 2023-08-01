import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class AddItemModal extends StatefulWidget {
  final void Function(String) onAddFile;
  final void Function(String) onAddFolder;

  const AddItemModal(
      {super.key, required this.onAddFile, required this.onAddFolder});

  @override
  _AddItemModalState createState() => _AddItemModalState();
}

class _AddItemModalState extends State<AddItemModal> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: defaultPadding,
        top: defaultPadding,
        right: defaultPadding,
        bottom: MediaQuery.of(context).viewInsets.bottom + padding16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Item Name',
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  final itemName = _textController.text.trim();
                  if (itemName.isNotEmpty) {
                    widget.onAddFile(itemName);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add File'),
              ),
              ElevatedButton(
                onPressed: () {
                  final folderName = _textController.text.trim();
                  if (folderName.isNotEmpty) {
                    widget.onAddFolder(folderName);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Folder'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
