import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sha BMI Calculator",
            style: TextStyle(
              color: yellowColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: appColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: yellowColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: yellowColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double h = double.parse(_heightController.text);
                  double w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = w / (h * h);
                    if (_bmiResult > 25) {
                      _textResult = "You are over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You have Normal weight";
                    } else {
                      _textResult = "You're under weight";
                    }
                  });
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: yellowColor),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: yellowColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: yellowColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const LeftBar(barWidth: 40),
              const SizedBox(
                height: 20,
              ),
              const LeftBar(barWidth: 70),
              const SizedBox(
                height: 20,
              ),
              const LeftBar(barWidth: 40),
              const SizedBox(
                height: 20,
              ),
              const RightBar(barWidth: 70),
              const SizedBox(
                height: 50,
              ),
              const RightBar(barWidth: 70)
            ],
          ),
        ),
      ),
    );
  }
}
