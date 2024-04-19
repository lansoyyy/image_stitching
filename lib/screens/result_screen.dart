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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.images.length; i++)
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Screenshot(
                        child: widget.images[i]['widget'],
                        controller: controllers[i]),
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Screenshot(
              controller: screenshotController,
              child: Center(
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
                                      for (int i = 0;
                                          i < widget.images.length;
                                          i++)
                                        widget.images[i]['value'] == 3
                                            ? widget.images[i]['widget']
                                            : const SizedBox()
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
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
                                      for (int i = 0;
                                          i < widget.images.length;
                                          i++)
                                        widget.images[i]['value'] == 2
                                            ? widget.images[i]['widget']
                                            : const SizedBox()
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
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
                                      for (int i = 0;
                                          i < widget.images.length;
                                          i++)
                                        widget.images[i]['value'] == 4
                                            ? widget.images[i]['widget']
                                            : const SizedBox()
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
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
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
