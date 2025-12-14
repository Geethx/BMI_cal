import 'package:flutter/material.dart';
import 'package:sample/constants.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
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

      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: kTileColor,
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

                    const SizedBox(width: 10),

                    Container(
                      padding: const EdgeInsets.all(20),
                      color: kTileColor,
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
                  ],
                ),

                SizedBox(height: 50),

                Container(
                  color: kTileColor,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text("Height", style: TextStyle(color: kActiveTextColor)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "183",
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
                        thumbColor: Colors.blueAccent,
                        activeColor: Colors.blueAccent,
                        min: 80,
                        max: 200,
                        value: 183,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: kTileColor,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(color: kActiveTextColor),
                          ),
                          Row(
                            children: [
                              Text(
                                "74",
                                style: TextStyle(
                                  color: kActiveTextColor,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "kg",
                                style: TextStyle(color: kActiveTextColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                elevation: 0,
                                shape: ShapeBorder.lerp(
                                  CircleBorder(),
                                  CircleBorder(),
                                  0.5,
                                ),
                                onPressed: () {},
                                child: Icon(Icons.remove),
                              ),

                              SizedBox(width: 10),

                              FloatingActionButton(
                                elevation: 0,
                                shape: ShapeBorder.lerp(
                                  CircleBorder(),
                                  CircleBorder(),
                                  0.5,
                                ),
                                onPressed: () {},
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 10),

                    Container(
                      color: kTileColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(color: kActiveTextColor),
                          ),
                          Row(
                            children: [
                              Text(
                                "19",
                                style: TextStyle(
                                  color: kActiveTextColor,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                elevation: 0,
                                shape: ShapeBorder.lerp(
                                  CircleBorder(),
                                  CircleBorder(),
                                  0.5,
                                ),
                                onPressed: () {},
                                child: Icon(Icons.remove),
                              ),

                              SizedBox(width: 10),

                              FloatingActionButton(
                                elevation: 0,
                                shape: ShapeBorder.lerp(
                                  CircleBorder(),
                                  CircleBorder(),
                                  0.5,
                                ),
                                onPressed: () {},
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 50),

            ElevatedButton(onPressed: () {}, child: Text("Calculate BMI")),
          ],
        ),
      ),
    );
  }
}
