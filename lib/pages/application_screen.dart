import 'dart:async';

import 'package:bmi_calculator/data/bmi_model.dart';
import 'package:bmi_calculator/pages/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  String? gender;
  double height = 170;
  int weight = 60;
  int age = 25;
  Timer? _timer;

  void _startIncrementWeight() {
    _timer = Timer.periodic(
      const Duration(
        milliseconds: 60,
      ),
      (timer) {
        setState(() {
          weight++;
        });
      },
    );
  }

  void _startDecrementWeight() {
    _timer = Timer.periodic(
      const Duration(
        milliseconds: 60,
      ),
      (timer) {
        if (weight > 0) {
          setState(() {
            weight--;
          });
        }
      },
    );
  }

  void _startIncrementAge() {
    _timer = Timer.periodic(
      const Duration(
        milliseconds: 60,
      ),
      (timer) {
        setState(() {
          age++;
        });
      },
    );
  }

  void _startDecrementAge() {
    _timer = Timer.periodic(
      const Duration(
        milliseconds: 60,
      ),
      (timer) {
        if (weight > 0) {
          setState(() {
            age--;
          });
        }
      },
    );
  }

  _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff2c284d),
        systemNavigationBarColor: Color(0xFFffffff),
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xff2c284d),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Center(
                  child: Text(
                    "BMI CALCULATOR",
                    style: TextStyle(
                      fontSize: 29,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            gender = 'male';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: gender == 'male'
                                ? const Color(0xffdc0165)
                                : const Color(0xff322c5a),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 40),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.male,
                                size: 50,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "MALE",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: gender == 'male'
                                      ? Colors.white
                                      : Colors.white38,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            gender = 'female';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: gender == 'female'
                                ? const Color(0xffdc0165)
                                : const Color(0xff322c5a),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 40),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.female,
                                size: 50,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: gender == 'female'
                                      ? Colors.white
                                      : Colors.white38,
                                  fontWeight: FontWeight.w300,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff322c5a),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white38,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${height.ceil()} CM",
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Slider(
                          value: height,
                          min: 120,
                          max: 220,
                          activeColor: const Color(0xffdc0165),
                          inactiveColor: Colors.white,
                          label: "${height.ceil()} CM",
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff322c5a),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "WEIGHT",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white38,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "$weight Kg",
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (weight > 0) {
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                  },
                                  onLongPress: () => _startDecrementWeight(),
                                  onLongPressUp: () => _stopTimer(),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4d438f),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  onLongPressUp: () => _stopTimer(),
                                  onLongPress: () => _startIncrementWeight(),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4d438f),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.add,
                                      size: 25,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff322c5a),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "AGE",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white38,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "$age",
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (age > 0) {
                                      setState(() {
                                        age--;
                                      });
                                    }
                                  },
                                  onLongPress: () => _startDecrementAge(),
                                  onLongPressUp: () => _stopTimer(),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4d438f),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  onLongPress: () => _startIncrementAge(),
                                  onLongPressUp: () => _stopTimer(),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4d438f),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.add,
                                      size: 25,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  var detail = BimModel(
                    gender: "$gender",
                    height: height,
                    weight: weight,
                    age: age,
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return BMIResultScreen(
                          detail: detail,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffdc0165),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Center(
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
