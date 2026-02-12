import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calculator_app/views/about_ui.dart';
import 'package:flutter_sau_health_calculator_app/views/bmi_ui.dart';
import 'package:flutter_sau_health_calculator_app/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  // สร้างตัวแปรเก็บ index ที่เลือกของ BottomNavigatorItem
  int barItemIndex = 1;

  // สร้างตัวแปรเก็บ UI ที่จะเอามาแสดงตามแต่ละ BarItem
  List showUi = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Body Health Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (paramValue) {
          setState(() {
            barItemIndex = paramValue;
          });
        },
        currentIndex: barItemIndex,
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "BMI",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heart,
            ),
            label: "BMR",
          ),
        ],
      ),
      body: showUi[barItemIndex],
    );
  }
}
