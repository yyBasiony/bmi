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
        backgroundColor: const Color(0xff8B8C9E),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffd9d4e7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),

          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: 350,
              decoration: BoxDecoration(
                color: Color(0xfffec7d7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Your Result is",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    resultText,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),


          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff8B8C9E),
                borderRadius: BorderRadius.circular(15),
              ),

              height: 65,
              width: double.infinity,
             // color: const Color(0xff8B8C9E),
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
          )
        ],
      ),
    );
  }
}
