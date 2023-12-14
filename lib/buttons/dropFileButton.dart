import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DropFileButton extends StatelessWidget {
  const DropFileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border:
            Border.all(color: Theme.of(context).colorScheme.primaryContainer),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            File file = File(result.files.single.path!);
            print("File ${file.path}");
          } else {
            print("File Canceled");
          }
          print("File Droped");
        },
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.upload_rounded,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "Documento de Antecedentes Criminais",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
