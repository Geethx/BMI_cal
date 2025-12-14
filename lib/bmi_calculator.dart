import 'package:flutter/material.dart';
import 'package:sample/constants.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  bool isMale = true;
  double height = 183;
  int weight = 74;
  int age = 19;
  double bmi = 0;

  double calculateBMI({required int weight, required double height}) {
    return weight / ((height / 100) * (height / 100));
  }

  Color getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 25) {
      return Colors.green;
    } else if (bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        foregroundColor: kActiveTextColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                      var bmiValue = calculateBMI(
                        weight: weight,
                        height: height,
                      );

                      setState(() {
                        bmi = bmiValue;
                      });
                    },
                    child: Container(
                      decoration: isMale
                          ? kSelectedTileBorderDecoration
                          : kTileBorderDecoration,
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        children: [
                          Icon(Icons.male, size: 50, color: kActiveTextColor),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 30,
                              color: kActiveTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Spacer(),

                Expanded(
                  flex: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                      var bmiValue = calculateBMI(
                        weight: weight,
                        height: height,
                      );

                      setState(() {
                        bmi = bmiValue;
                      });
                    },
                    child: Container(
                      decoration: !isMale
                          ? kSelectedTileBorderDecoration
                          : kTileBorderDecoration,
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.female,
                            size: 50,
                            color: kInactiveTextColor,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              color: kInactiveTextColor,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kTileColor,
              ),

              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Height", style: TextStyle(color: kActiveTextColor)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toStringAsFixed(1),
                        style: TextStyle(
                          color: kActiveTextColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("cm", style: TextStyle(color: kActiveTextColor)),
                    ],
                  ),
                  Slider(
                    thumbColor: kButtonClolor,
                    activeColor: Colors.white,
                    min: 80,
                    max: 200,
                    value: height,
                    onChanged: (val) {
                      setState(() {
                        height = val;
                      });
                      var bmiValue = calculateBMI(
                        weight: weight,
                        height: height,
                      );

                      setState(() {
                        bmi = bmiValue;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kTileColor,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(color: kActiveTextColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$weight",
                              style: TextStyle(
                                color: kActiveTextColor,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "kg",
                              style: TextStyle(color: kActiveTextColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              elevation: 0,
                              backgroundColor: const Color.fromARGB(
                                255,
                                64,
                                37,
                                96,
                              ),
                              shape: ShapeBorder.lerp(
                                CircleBorder(),
                                CircleBorder(),
                                0.2,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (weight > 25) {
                                    weight--;
                                  }
                                });
                                var bmiValue = calculateBMI(
                                  weight: weight,
                                  height: height,
                                );

                                setState(() {
                                  bmi = bmiValue;
                                });
                              },
                              child: Icon(Icons.remove, color: Colors.white),
                            ),

                            SizedBox(width: 10),

                            FloatingActionButton(
                              elevation: 0,
                              backgroundColor: const Color.fromARGB(
                                255,
                                64,
                                37,
                                96,
                              ),
                              shape: ShapeBorder.lerp(
                                CircleBorder(),
                                CircleBorder(),
                                0.2,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) {
                                    weight++;
                                  }
                                });
                                var bmiValue = calculateBMI(
                                  weight: weight,
                                  height: height,
                                );

                                setState(() {
                                  bmi = bmiValue;
                                });
                              },
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kTileColor,
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text("AGE", style: TextStyle(color: kActiveTextColor)),
                        Text(
                          "$age",
                          style: TextStyle(
                            color: kActiveTextColor,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              elevation: 0,
                              backgroundColor: const Color.fromARGB(
                                255,
                                64,
                                37,
                                96,
                              ),
                              shape: ShapeBorder.lerp(
                                CircleBorder(),
                                CircleBorder(),
                                0.2,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                                var bmiValue = calculateBMI(
                                  weight: weight,
                                  height: height,
                                );

                                setState(() {
                                  bmi = bmiValue;
                                });
                              },
                              child: Icon(Icons.remove, color: Colors.white),
                            ),

                            SizedBox(width: 10),

                            FloatingActionButton(
                              elevation: 0,
                              backgroundColor: const Color.fromARGB(
                                255,
                                64,
                                37,
                                96,
                              ),
                              shape: ShapeBorder.lerp(
                                CircleBorder(),
                                CircleBorder(),
                                0.2,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });

                                var bmiValue = calculateBMI(
                                  weight: weight,
                                  height: height,
                                );

                                setState(() {
                                  bmi = bmiValue;
                                });
                              },
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: kTileBorderDecoration,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("BMI", style: TextStyle(color: kActiveTextColor)),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(
                      color: getBMIColor(bmi),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
