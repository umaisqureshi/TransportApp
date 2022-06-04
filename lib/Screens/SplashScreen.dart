import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Homepage.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black,
                child: Image.asset(
                  'assets/image2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )),
            const Positioned(
              bottom: 50,
              right: 50,
              left: 50,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5.0,
                  color: Color.fromARGB(255, 97, 3, 3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
