
import 'package:assignment/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _navigateToHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Hey'
      ),
    );
  }

  void _navigateToHomeScreen()
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }
}
