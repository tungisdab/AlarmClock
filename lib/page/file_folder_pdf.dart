import 'package:flutter/material.dart';

class FileFolderPdf extends StatefulWidget {
  const FileFolderPdf({super.key});

  @override
  State<FileFolderPdf> createState() => _FileFolderPdfState();
}

class _FileFolderPdfState extends State<FileFolderPdf> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child :Row(
              children: [
                Icon(Icons.folder),
                Text('Folder'),
              ],
            ),
          ),
          Text('khanh'),
          Text('khanh'),
          Text('khanh'),
          Text('khanh'),
          Text('khanh'),
          Text('khanh'),
          Text('khanh'),
          Text('khanh'),
        ],
      ),
    );
  }
}