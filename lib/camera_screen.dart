import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';

class CameraScreen extends StatefulWidget {

  String imagePath = '';

  CameraScreen(String filePath)
  {
    this.imagePath = filePath;
  }

  @override
  _CameraScreenState createState() => _CameraScreenState(imagePath);
}

class _CameraScreenState extends State<CameraScreen>
{
  String imagePath;

  _CameraScreenState(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton
            (
              onPressed: () => _fromGogle(imagePath),
              child: Text(
                  'Extract Text'
              )
          ),
        ),
      ),
    );
  }

  /*void _performTextRecognition(imagePath) async
  {
    print("extracting Text ........ ");
    File file = File(imagePath);
    *//*if(Platform.isIOS)
      {
        file = await FlutterExifRotation.rotateImage(path: imagePath);
      }*//*
    final visionImage = FirebaseVisionImage.fromFile(file);
    print("extracting Text ........ " + imagePath);

    final textRecognizer = FirebaseVision.instance.textRecognizer();

    print("imagePath ........ " + imagePath);
    final extractedText = await textRecognizer.processImage(visionImage);

    print("extractedText " + extractedText.text);

    Fluttertoast.showToast(msg: extractedText.text, toastLength: Toast.LENGTH_LONG);
  }*/

  void _fromGogle(String imagePath) async
  {
    File file = File(imagePath);

    if(Platform.isIOS)
  {
    file = await FlutterExifRotation.rotateImage(path: imagePath);
  }
    final inputIamge = InputImage.fromFile(file);
    final textDetector = GoogleMlKit.vision.textDetector();
    Fluttertoast.showToast(msg: "Extracting.... ");
    final text = await textDetector.processImage(inputIamge);

    Fluttertoast.showToast(msg: "Extracted ");

    print("text " + text.text);
    Fluttertoast.showToast(msg: text.text, toastLength: Toast.LENGTH_LONG);
  }
}
