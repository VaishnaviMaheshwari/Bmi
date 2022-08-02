import 'package:bmi/components/custom_card.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi/screens/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender gender_selected = Gender.male;
  int height = 150;
  int weight = 50;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' WELCOME TO BMI CALCULATOR'),
        ),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                child: GenderCard(
                  gender: 'MALE',
                  icon: Icons.male,
                  isSelected: gender_selected == Gender.male ? true : false,
                  onTap: () {
                    setState(() {
                      gender_selected = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: GenderCard(
                    gender: 'FEMALE',
                    icon: Icons.female,
                    isSelected: gender_selected == Gender.female ? true : false,
                    onTap: () {
                      setState(() {
                        gender_selected = Gender.female;
                      });
                    }),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 200,
            // color: Color.fromARGB(255, 50, 44, 44),
            child: SliderCard(
              value: height,
              title: 'HEIGHT',
              unit: 'cm',
              onChanged: (val) {
                setState(() {
                  height = val.toInt();
                  print(height);
                });
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AWcard(
                    title: 'WEIGHT',
                    value: weight,
                    onPressedminus: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onPressedplus: () {
                      setState(() {
                        weight++;
                      });
                    }),
              ),
              Expanded(
                child: AWcard(
                  title: 'AGE',
                  value: age,
                  onPressedminus: () {
                    setState(() {
                      age--;
                    });
                  },
                  onPressedplus: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              onTap: () {
                print('Calculate');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      gender: gender_selected,
                      height: height,
                      age: age,
                      weight: weight,
                    );
                  }),
                );
              },
              title: 'CALCULATE YOUR BMI',
            ),
          ),
        ]));
  }
}
