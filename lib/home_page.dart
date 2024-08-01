import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 159;
  int age = 20;
  int weight = 60;
  bool isMale = true;

  void addAge() {
    setState(() {
      age++;
    });
  }

  void minusAge() {
    setState(() {
      age--;
    });
  }

  void addWeight() {
    setState(() {
      weight++;
    });
  }

  void minusWeight() {
    setState(() {
      weight--;
    });
  }
  double calculateBMI() {
    double heightInMeters = height / 100;
    return weight / pow(heightInMeters, 2);
  }

  String getResultText(double bmi) {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (bmi >= 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8B8C9E),
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFd9d4e7),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Color(0xFFd9d4e7) : Color(0xFFfec7d7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70,
                              color: Color(0xffFFFFFF),
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff8B8C9E)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Color(0xFFfec7d7) : Color(0xFFd9d4e7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 70,
                              color: Color(0xffFFFFFF),
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff8B8C9E)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xfffec7d7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style:
                      TextStyle(fontSize: 20, color: Color(0xff8B8C9E)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.round().toString(),
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "cm",
                          style: TextStyle(
                              fontSize: 12, color: Color(0xffFFFFFF)),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      min: 0,
                      max: 250,
                      label: height.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          height = value;
                        });
                      },
                      activeColor: Color(0xff8B8C9E),
                      inactiveColor: Color(0xffFFFFFF),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xfffec7d7),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff8B8C9E)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$weight",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Kg",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8B8C9E)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xff8B8C9E),
                                  child: InkWell(
                                      onTap: addWeight,
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Color(0xffFFFFFF),
                                      ))),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xff8B8C9E),
                                  child: InkWell(
                                      onTap: minusWeight,
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: Color(0xffFFFFFF),
                                      ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xfffec7d7),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff8B8C9E)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$age",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "year",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8B8C9E)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xff8B8C9E),
                                  child: InkWell(
                                      onTap: addAge,
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Color(0xffFFFFFF),
                                      ))),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xff8B8C9E),
                                  child: InkWell(
                                      onTap: minusAge,
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: Color(0xffFFFFFF),
                                      ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff8B8C9E),
                borderRadius: BorderRadius.circular(15),
              ),

              height: 65,
              width: double.infinity,
              //color: const Color(0xff8B8C9E),
              child: MaterialButton(
                onPressed: () {
                  double bmi = calculateBMI();
                  String resultText = getResultText(bmi);
                  String interpretation = getInterpretation(bmi);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmi: bmi,
                        resultText: resultText,
                        interpretation: interpretation,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Calculate",
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
