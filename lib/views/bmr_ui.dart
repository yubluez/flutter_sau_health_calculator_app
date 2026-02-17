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
  double bmr = 0.0;

  void calculateBMR() {
    double weight = double.tryParse(weightCtrl.text) ?? 0;
    double height = double.tryParse(heightCtrl.text) ?? 0;
    double age = double.tryParse(ageCtrl.text) ?? 0;

    if (weight <= 0 || height <= 0 || age <= 0) return;

    setState(() {
      if (gender == "male") {
        bmr = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
      } else {
        bmr = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
      }
    });
  }

  void clearData() {
    setState(() {
      weightCtrl.clear();
      heightCtrl.clear();
      ageCtrl.clear();
      bmr = 0.0;
      gender = "male";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(45.0),
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
                        child: const Text("หญิง"),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calculateBMR,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "คำนวณ BMI",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: clearData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "ล้างข้อมูล",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "BMI",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        bmr.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("kcal/day"),
                      SizedBox(height: 20.0),
                    ],
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
