import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ReadPdf extends StatefulWidget {
  // final File file;
  const ReadPdf({super.key});

  @override
  State<ReadPdf> createState() => _ReadPdfState();
}

class _ReadPdfState extends State<ReadPdf> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.red.shade200,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.picture_as_pdf),
            icon: Icon(Icons.picture_as_pdf_outlined),
            label: 'Read',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.folder),
            icon: Icon(Icons.folder_copy_outlined),
            label: 'Folder',
          ),
        ],
      ),
      body: <Widget>[
        readFile(),
        fileFolder(),
      ][currentPageIndex],
    );
  }

  Widget readFile(){
    return SafeArea(
      child: Text('readFile'),
    );
  }

  Widget fileFolder(){
    return SafeArea(
      child: Text('fileFolder'),
    );
  }

}