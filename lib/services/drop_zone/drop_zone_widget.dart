import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../../models/drop_file_model.dart';

/// Drop zone widget
class DropZoneWidget extends StatefulWidget {

  const DropZoneWidget({required this.onDroppedFile, Key? key}):super(key: key);

  final ValueChanged<FileDataModel> onDroppedFile;
  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
        child: Stack(
          children: [
            DropzoneView(
              onCreated: (DropzoneViewController controller) => this.controller = controller,
              onDrop: uploadedFile,
              onHover:() => setState(()=> highlight = true),
              onLeave: ()=> setState(()=>highlight = false),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.cloud_upload_outlined,
                    size: 80,
                    color: Colors.white,
                  ),
                  const Text(
                    'Upload File Here',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final List events = await controller.pickFiles();
                      if(events.isEmpty) return;
                      uploadedFile(events.first);
                    },
                    icon: const Icon(Icons.search),
                    label: const Text(
                      'Choose File',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20
                        ), backgroundColor: highlight? Colors.blue: Colors.green.shade300,
                        shape: const RoundedRectangleBorder()
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Future uploadedFile(dynamic event) async {
    final name = event.name;

    final String mime = await controller.getFileMIME(event);
    final int byte = await controller.getFileSize(event);
    final String url = await controller.createFileUrl(event);

    // print('Name : $name');
    // print('Mime: $mime');
    //
    // print('Size : ${byte / (1024 * 1024)}');
    // print('URL: $url');

    final FileDataModel droppedFile = FileDataModel
      (name: name, mime: mime, bytes: byte, url: url);

    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}){
    final Color colorBackground =  highlight? Colors.blue: Colors.white30;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: colorBackground,
        child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.white,
            strokeWidth: 3,
            dashPattern: const [8,4],
            radius: const Radius.circular(10),
            padding: EdgeInsets.zero,
            child: child
        ),
      ),
    );
  }
}