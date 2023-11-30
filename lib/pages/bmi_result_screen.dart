import 'package:bmi_calculator/data/bmi_model.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatefulWidget {
  final BimModel detail;
  const BMIResultScreen({
    super.key,
    required this.detail,
  });

  @override
  State<BMIResultScreen> createState() => _BMIResultScreenState();
}

class _BMIResultScreenState extends State<BMIResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c284d),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              const Color(0xff2c284d).withOpacity(.2),
              BlendMode.dstATop,
            ),
            image: AssetImage(
              widget.detail.status.imageLink,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          children: [
            SizedBox(
              height: MediaQuery.paddingOf(context).top,
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white54,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "YOUR HEALTH STATUS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                widget.detail.bmi.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "Your BMI index",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Center(
              child: Text(
                widget.detail.status.status,
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xffdc0165),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.detail.status.description,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Advices",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.detail.status.advice,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: MediaQuery.paddingOf(context).top,
            ),
          ],
        ),
      ),
    );
  }
}
