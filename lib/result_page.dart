import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String resultText;
  final String interpretation;

  const ResultPage(
      {super.key, required this.bmi, required this.resultText, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff333244),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF24263B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your BMI is",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                ),
              ),
              const SizedBox(height: 20),
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              const SizedBox(height: 20),
              Text(
                resultText,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),
              ),
              const SizedBox(height: 20),
              Text(
                interpretation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                ),
              ),
            ],
          ),
          SizedBox(height: 150,),
          Container(
            height: 65,
            width: double.infinity,
            color: const Color(0xffE83D67),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Re-calculate",
                style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
