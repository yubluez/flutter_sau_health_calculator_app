// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  final TextEditingController weightCtrl = TextEditingController();
  final TextEditingController heightCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();

  String gender = "male";

  double bmrValue = 0.0;

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
                  "คำนวณหาอัตราการเผาผลาญที่ร่างกายต้องการ (BMR)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Image.asset(
                  "assets/images/bmr.png",
                  width: 180.0,
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          shadowColor: Colors.grey,
                          fixedSize: Size(
                            130.0,
                            50.0,
                          ),
                          backgroundColor: gender == "male"
                              ? Colors.blue.shade100
                              : Colors.grey.shade200,
                          foregroundColor: gender == "male"
                              ? Colors.blue.shade900
                              : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            gender = "male";
                          });
                        },
                        child: const Text("ชาย"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          shadowColor: Colors.grey,
                          fixedSize: Size(
                            130.0,
                            50.0,
                          ),
                          backgroundColor: gender == "female"
                              ? Colors.pink.shade100
                              : Colors.grey.shade200,
                          foregroundColor: gender == "female"
                              ? Colors.pink.shade900
                              : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            gender = "female";
                          });
                        },
                        child: Text("หญิง"),
                      ),
                    ),
                  ],
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
                SizedBox(height: 25.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ (ปี)',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: ageCtrl,
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
                    // Validate input
                    if (weightCtrl.text.isEmpty ||
                        heightCtrl.text.isEmpty ||
                        ageCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'กรุณากรอกข้อมูลให้ครบ',
                          ),
                          backgroundColor: Colors.purple,
                          duration: Duration(seconds: 2),
                        ),
                      );

                      return;
                    }

                    // คำนวณ BMR
                    double weight = double.parse(weightCtrl.text);
                    double height = double.parse(heightCtrl.text);
                    int age = int.parse(ageCtrl.text);
                    double bmr = 0;

                    if (gender == "ชาย") {
                      bmr = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
                    } else {
                      bmr = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
                    }

                    setState(() {
                      bmrValue = bmr;
                    });
                  },
                  child: Text(
                    'คํานวณ BMR',
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
                SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      weightCtrl.text = "";
                      heightCtrl.text = "";
                      ageCtrl.text = "";
                      bmrValue = 0;
                      gender = "ชาย";
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
                            'BMR',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            bmrValue.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'kcal/day',
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
