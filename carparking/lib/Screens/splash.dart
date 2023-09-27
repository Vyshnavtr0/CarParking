import 'package:carparking/Screens/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> nextScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (_) => Home()));
    // });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Text(
        "Car Parking",
        style: TextStyle(color: Colors.white, fontSize: 22),
      )),
    );
  }
}
