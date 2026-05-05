// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var heightControllerFeet = TextEditingController();
  var heightControllerInch = TextEditingController();
  var weightController = TextEditingController();
  var result = '';
  var bmiColor = Colors.deepPurple.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple.shade50,
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 650,
              child: Card(
                color: bmiColor ,
                elevation: 8,
                shadowColor: Colors.deepPurple,
                margin: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'BMI (Body Mass Index) Calculator',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        'assets/images/bmi.avif',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      width: 260,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.monitor_weight_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusColor: Colors.deepPurple,
                          labelText: 'Enter your weight (kg)',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 260,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: heightControllerFeet,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.height),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusColor: Colors.deepPurple,
                          labelText: 'Enter your height (feet)',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 260,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: heightControllerInch,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.height),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusColor: Colors.deepPurple,
                          labelText: 'Enter your height (inch)',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(
                          horizontal: 95,
                          vertical: 15,
                        ),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        var weight = weightController.text.toString();
                        var heightFeet = heightControllerFeet.text.toString();
                        var heightInch = heightControllerInch.text.toString();
        
                        if (weight != "" &&
                            heightFeet != "" &&
                            heightInch != "") {
                          // BMI Calculation
                          var weightInKg = double.parse(weight);
                          var heightInFeet = double.parse(heightFeet);
                          var heightInInch = double.parse(heightInch);
        
                          var totalHeightInInch =
                              (heightInFeet * 12) + heightInInch;
                          var totalHeightInCm = totalHeightInInch * 2.54;
                          var totalHeightInM = totalHeightInCm / 100;
                          var bmi =
                              weightInKg / (totalHeightInM * totalHeightInM);
                          var msg = '';
                          if (bmi < 18.5) {
                            msg = "You are Underweight!!";
                            bmiColor = Colors.blue.shade300;
                          } else if (bmi >= 18.5 && bmi < 24.9) {
                            msg = "You have a Normal Weight!!";
                            bmiColor = Colors.green.shade300;
                          } else if (bmi >= 25 && bmi < 29.9) {
                            msg = "You are Overweight!!";
                            bmiColor = Colors.orange.shade300;
                          } else if (bmi >= 30 && bmi < 34.9) {
                            msg = "You are Obese!!";
                            bmiColor = Colors.red.shade300;
                          } else {
                            msg = "You are Extremely Obese!!";
                            bmiColor = Colors.red.shade600;
                          }
                          setState(() {
                            result =
                                "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks!";
                          });
                        }
                      },
                      child: const Text(
                        'Calculate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      result,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
