import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_stitching/screens/selection_screen.dart';
import 'package:image_stitching/widgets/text_widget.dart';

class ResultScreen extends StatefulWidget {
  List images;

  ResultScreen({
    super.key,
    required this.images,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.images.length; i++)
                Stack(
                  children: [
                    SizedBox(
                        height: 250,
                        width: 250,
                        child: widget.images[i]['widget']),
                    Padding(
                      padding: const EdgeInsets.only(left: 45, top: 5),
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: widget.images[i]['point'],
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
