import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImagePreviewPage extends StatelessWidget {
  Uint8List? img;

  ImagePreviewPage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 250, width: 250, child: Image.memory(img!)),
        ],
      ),
    );
  }
}
