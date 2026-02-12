import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200.0),
              Text(
                "Body Health Calculator",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 20.0),
              Image.asset(
                "assets/images/logo.png",
                width: 180.0,
                height: 180.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.0),
              Text(
                "คำนวณหาค่าดัชนีมวลกาย (BMI)",
              ),
              SizedBox(height: 20.0),
              Text(
                "คำนวณหาค่าแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)",
              ),
              SizedBox(height: 140.0),
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/4/47/Logosau-02.png",
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.0),
              Text(
                "Developed by Yubluez SAU 2026",
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
