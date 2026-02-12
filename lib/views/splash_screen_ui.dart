// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calculator_app/views/home_ui.dart';

class SplashscreenUi extends StatefulWidget {
  const SplashscreenUi({super.key});

  @override
  State<SplashscreenUi> createState() => _SplashscreenUiState();
}

class _SplashscreenUiState extends State<SplashscreenUi> {
  @override
  void initState() {
    // หน่วงเวลา เมื่อครบกำหนดให้เปิดไปหน้าจอ HomeUi แบบย้อนกลับไม่ได้
    Future.delayed(
      // ระยะเวลาที่หน่วง
      Duration(seconds: 3),
      // เมื่อครบเวลาที่หน่วงแล้วจะให้ทำอะไร
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 180.0,
              height: 180.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            Text(
              "Body Health Calculator",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
