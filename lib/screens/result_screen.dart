import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_stitching/screens/selection_screen.dart';
import 'package:image_stitching/widgets/text_widget.dart';

class ResultScreen extends StatefulWidget {
  List images;

  ResultScreen({super.key, required this.images});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SelectionScreen()));
            },
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.save),
                TextWidget(
                  text: 'Original',
                  fontSize: 11,
                ),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.save),
                TextWidget(
                  text: 'Stitched',
                  fontSize: 11,
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 250,
                  height: 600,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < widget.images.length; i++)
                        widget.images[i]['value'] == 6
                            ? widget.images[i]['widget']
                            : const SizedBox()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    height: 40,
                    width: 125,
                    color: Colors.blue.withOpacity(0.5),
                    child: Center(
                      child: TextWidget(
                        text: 'Back',
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 500,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < widget.images.length; i++)
                            widget.images[i]['value'] == 1
                                ? widget.images[i]['widget']
                                : const SizedBox()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        height: 40,
                        width: 125,
                        color: Colors.blue.withOpacity(0.5),
                        child: Center(
                          child: TextWidget(
                            text: 'Top',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 166,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0; i < widget.images.length; i++)
                                widget.images[i]['value'] == 3
                                    ? widget.images[i]['widget']
                                    : const SizedBox()
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            height: 40,
                            width: 125,
                            color: Colors.blue.withOpacity(0.5),
                            child: Center(
                              child: TextWidget(
                                text: 'Left',
                                fontSize: 14,
                                fontFamily: 'Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 166,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0; i < widget.images.length; i++)
                                widget.images[i]['value'] == 2
                                    ? widget.images[i]['widget']
                                    : const SizedBox()
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            height: 40,
                            width: 125,
                            color: Colors.blue.withOpacity(0.5),
                            child: Center(
                              child: TextWidget(
                                text: 'Front',
                                fontSize: 14,
                                fontFamily: 'Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 166,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0; i < widget.images.length; i++)
                                widget.images[i]['value'] == 4
                                    ? widget.images[i]['widget']
                                    : const SizedBox()
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            height: 40,
                            width: 125,
                            color: Colors.blue.withOpacity(0.5),
                            child: Center(
                              child: TextWidget(
                                text: 'Right',
                                fontSize: 14,
                                fontFamily: 'Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: 500,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < widget.images.length; i++)
                            widget.images[i]['value'] == 5
                                ? widget.images[i]['widget']
                                : const SizedBox()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        height: 40,
                        width: 125,
                        color: Colors.blue.withOpacity(0.5),
                        child: Center(
                          child: TextWidget(
                            text: 'Bottom',
                            fontSize: 14,
                            fontFamily: 'Bold',
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
      ),
    );
  }
}
