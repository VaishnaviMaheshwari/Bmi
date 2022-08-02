import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key: key);
  final Gender gender;
  final int height;
  final int weight;
  final int age;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmi = 0.0;
  String result = '';
  String gender = '';
  String img = '';

  void calculate() {
    setState(() {
      gender = this.widget.gender == Gender.male ? 'male' : 'female';

      bmi = this.widget.weight /
          ((this.widget.height / 100) * (this.widget.height / 100));
      if (bmi < 18.5) {
        result = 'UnderWeight';
      } else if (bmi < 25) {
        result = 'Normal';
      } else if (bmi < 30) {
        result = 'OverWeight';
      } else if (bmi < 35) {
        result = 'Obese';
      } else {
        result = 'ExtremelyObese';
      }
      img = 'images/${gender}_${result}.png';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      calculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffa0e21),
      appBar: AppBar(
        title: Text(
          'RESULT',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 219, 225, 229),
                borderRadius: BorderRadius.circular(10),
              ),

              margin: EdgeInsets.all(5),
              //color: Color.fromARGB(255, 245, 239, 239),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(this.img),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff2a2e31),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Score: ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${this.bmi.toStringAsFixed(4)}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                //border: Border.all(
                //color: Color.fromARGB(255, 213, 218, 202), width: 5),
                color: Color.fromARGB(255, 253, 254, 254),
                borderRadius: BorderRadius.circular(0),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Text(
                '${result}',
                style: TextStyle(
                  color: Color.fromARGB(255, 43, 166, 185),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2a2e31),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 50,
                width: 200,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Recalculate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
    );
  }
}
