import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_trimmer/video_trimmer.dart';

import 'trimmer_view.dart';

class HomePage extends StatelessWidget {
  final Trimmer _trimmer = Trimmer();
  final ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: const Text('LOAD VIDEO'),
            onPressed: () async {
              final file = await imagePicker.getVideo(
                source: ImageSource.gallery,
              );
              if (file != null) {
                await _trimmer.loadVideo(videoFile: File(file.path));
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TrimmerView(_trimmer);
                }));
              }
            },
          ),
        ),
      ),
    );
  }
}
