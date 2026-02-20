// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //สร้างตัวควบคุม TextField
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();

  //สร้างตัวแปรสำหรับเก็บค่า BMI และการแปลผล
  double bmiValue = 0;
  String bmiResult = 'การแปรผล';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.0, //ซ้าย-ขวา
            vertical: 40.0, //บน-ล่าง
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  "คำนวณหาค่าดัชนีมวลกาย (BMI)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Image.asset(
                  "assets/images/bmi.png",
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg)',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรอกน้ำหนักของคุณ',
                    fillColor: const Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm)',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรอกส่วนสูงของคุณ',
                    fillColor: const Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    //Validate Input
                    if (weightCtrl.text.length == 0 ||
                        heightCtrl.text.length == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบ'),
                          backgroundColor: Colors.purple,
                          duration: Duration(seconds: 2),
                        ),
                      );

                      return;
                    }

                    //คำนวณ BMI
                    double weight = double.parse(weightCtrl.text);
                    double height = double.parse(heightCtrl.text);
                    double bmi = weight / ((height / 100) * (height / 100));
                    setState(() {
                      bmiValue = bmi;
                    });

                    //แปลผล BMI
                    setState(() {
                      if (bmi < 18.5) {
                        bmiResult = 'ผอมไป';
                      } else if (bmi <= 24.9) {
                        bmiResult = 'ปกติ';
                      } else if (bmi <= 29.9) {
                        bmiResult = 'เริ่มอ้วน';
                      } else if (bmi <= 34.9) {
                        bmiResult = 'โรคอ้วนระดับ 1';
                      } else {
                        bmiResult = 'โรคอ้วนระดับ 2';
                      }
                    });
                  },
                  child: Text(
                    'คํานวณ BMI',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      weightCtrl.text = '';
                      heightCtrl.text = '';
                      bmiValue = 0;
                      bmiResult = 'การแปรผล';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 3.0,
                    color: Colors.green[100],
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'BMI',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            bmiValue.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            bmiResult,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
