import 'dart:html';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_stitching/screens/selection_screen.dart';
import 'package:image_stitching/widgets/text_widget.dart';
import 'package:screenshot/screenshot.dart';

class ResultScreen extends StatefulWidget {
  List images;

  ResultScreen({super.key, required this.images});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  List<ScreenshotController> controllers = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.images.length; i++) {
      controllers.add(ScreenshotController());
    }
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
            onPressed: () async {
              for (int i = 0; i < controllers.length; i++) {
                Uint8List? bytes = await controllers[i].capture();
                if (bytes != null) {
                  final blob = html.Blob([bytes]);
                  final url = html.Url.createObjectUrlFromBlob(blob);

                  final anchor = html.AnchorElement(href: url)
                    ..setAttribute('download', 'original image.png')
                    ..click();

                  html.Url.revokeObjectUrl(url);
                }
              }
            },
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.download),
                  TextWidget(
                    text: 'Stitched',
                    fontSize: 11,
                  ),
                ],
              ),
              onPressed: () async {
                Uint8List? bytes = await screenshotController.capture();
                if (bytes != null) {
                  final blob = html.Blob([bytes]);
                  final url = html.Url.createObjectUrlFromBlob(blob);

                  final anchor = html.AnchorElement(href: url)
                    ..setAttribute('download', 'stitched image.png')
                    ..click();

                  html.Url.revokeObjectUrl(url);
                }
              }),
        ],
      ),
      body: originalWidget(),
    );
  }

  Widget originalWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Screenshot(
            controller: screenshotController,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
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
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < widget.images.length;
                                        i++)
                                      widget.images[i]['value'] == 3
                                          ? widget.images[i]['widget']
                                          : const SizedBox()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < widget.images.length;
                                        i++)
                                      widget.images[i]['value'] == 2
                                          ? widget.images[i]['widget']
                                          : const SizedBox()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < widget.images.length;
                                        i++)
                                      widget.images[i]['value'] == 4
                                          ? widget.images[i]['widget']
                                          : const SizedBox()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       decoration: const BoxDecoration(),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           for (int i = 0; i < widget.images.length; i++)
                      //             widget.images[i]['value'] == 5
                      //                 ? widget.images[i]['widget']
                      //                 : const SizedBox()
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget newWidget() {
    return Center(
      child: SizedBox(
        height: 500,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/Panorama_of_the_courtyard_of_the_Great_Mosque_of_Kairouan.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
