import 'package:assignment/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BuildContext _context;

  final _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Builder(
          builder: (context) => ElevatedButton(
          onPressed: () {
            _openCamera(context);
          },

          child: Text('Scan'),
        ),
        ),
      ),
    ));
  }

  void _openCamera(BuildContext context) async
  {
    final capturedImage = await _imagePicker.pickImage(source: ImageSource.camera);

    if(capturedImage == null)
      {
        return;
      }

    Fluttertoast.showToast(msg: 'captured', toastLength: Toast.LENGTH_LONG);

    if(capturedImage.path == null)
      {
        Fluttertoast.showToast(msg: 'Null', toastLength: Toast.LENGTH_LONG);
      }
    else
      {
        Fluttertoast.showToast(msg: 'Routing', toastLength: Toast.LENGTH_LONG);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraScreen(capturedImage.path)));
      }
  }
}
