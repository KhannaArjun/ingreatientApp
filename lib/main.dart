
import 'package:assignment/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomeScreen());
}


class Ingreatients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration(seconds: 3)).then((value) => HomeScreen());
    return MaterialApp(
      title: 'Ingreatient',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello'
          ),
        ),
      ),
    );
  }
}
