import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  final TextEditingController weightCtrl = TextEditingController();
  final TextEditingController heightCtrl = TextEditingController();

  double bmi = 0.0;

  void calculateBMI() {
    double weight = double.tryParse(weightCtrl.text) ?? 0;
    double height = double.tryParse(heightCtrl.text) ?? 0;

    if (weight > 0 && height > 0) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100));
      });
    }
  }

  void clearData() {
    setState(() {
      weightCtrl.clear();
      heightCtrl.clear();
      bmi = 0.0;
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
                  "คำนวณหาค่าดัชนีมวลกาย (BMI)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Image.asset(
                  "assets/images/bmi.png",
                  width: 180.0,
                  height: 180.0,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calculateBMI,
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "BMI",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        bmi.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
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
