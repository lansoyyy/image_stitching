import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_stitching/screens/camera_page.dart';
import 'package:image_stitching/screens/home_screen.dart';
import 'package:image_stitching/screens/result_screen.dart';
import 'package:image_stitching/screens/selection_screen.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Termitector',
      home: HomeScreen(),
    );
  }
}
