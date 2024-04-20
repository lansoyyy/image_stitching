import 'dart:html';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:image_stitching/main.dart';
import 'package:image_stitching/screens/end_scanning_screen.dart';
import 'package:image_stitching/widgets/button_widget.dart';
import 'package:image_stitching/widgets/text_widget.dart';
import 'dart:html' as html;

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  late CameraController controller;
  List<int>? imgBytes;

  String img = '';

  List images = [];

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            card(Icons.arrow_upward, 'Press Top', 1, 'Top'),
            const SizedBox(
              width: 50,
            ),
            card(Icons.front_hand, 'Press Front', 2, 'Front'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            card(Icons.keyboard_arrow_left_outlined, 'Press Left Side', 3,
                'Left'),
            const SizedBox(
              width: 50,
            ),
            card(Icons.keyboard_arrow_right, 'Press Right Side', 4, 'Right'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            card(Icons.arrow_downward, 'Press Bottom', 5, 'Bottom'),
            const SizedBox(
              width: 50,
            ),
            card(Icons.back_hand, 'Press Back', 6, 'Back'),
          ],
        ),
      ],
    ));
  }

  Widget card(IconData icon, String label, int val, String point) {
    return GestureDetector(
      onTap: () async {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: SizedBox(
                width: 500,
                height: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 400,
                        height: 400,
                        child: CameraPreview(controller)),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                      label: 'Capture',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );

        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return AlertDialog(
        //       content: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           SizedBox(height: 250, width: 250, child: fromPicker!),
        //         ],
        //       ),
        //       actions: [
        //         Container(
        //           color: Colors.blue,
        //           child: TextButton(
        //             onPressed: () {
        //               Navigator.pop(context);
        //             },
        //             child: TextWidget(
        //               text: 'Scan other dimensions',
        //               color: Colors.white,
        //               fontSize: 14,
        //             ),
        //           ),
        //         ),
        //         Container(
        //           color: Colors.blue,
        //           child: TextButton(
        //             onPressed: () {
        //               Navigator.of(context).pushReplacement(MaterialPageRoute(
        //                   builder: (context) => EndScanningScreen(
        //                         images: images,
        //                       )));
        //             },
        //             child: TextWidget(
        //               text: 'Continue',
        //               color: Colors.white,
        //               fontSize: 14,
        //             ),
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // );
      },
      child: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: Container(
            width: 250,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 125,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text: label,
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Bold',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
