import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.gender,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final IconData icon;
  final String gender;
  final onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? cCardPrimaryBGColorSelected : cCardPrimaryBGColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              size: 100,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              this.gender,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AWcard extends StatelessWidget {
  const AWcard(
      {Key? key,
      this.title = '',
      this.value = 0,
      required this.onPressedminus,
      required this.onPressedplus})
      : super(key: key);
  final String title;
  final int value;
  final onPressedminus;
  final onPressedplus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cCardPrimaryBGColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '${this.value}',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonRound(text: '-', onPressed: this.onPressedminus),
              ButtonRound(
                text: '+',
                onPressed: this.onPressedplus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonRound extends StatelessWidget {
  const ButtonRound({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: RawMaterialButton(
        padding: const EdgeInsets.all(3),
        onPressed: this.onPressed,
        shape: const CircleBorder(),
        fillColor: cCardPrimaryBGColorButton,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard(
      {Key? key,
      required this.onChanged,
      this.title = '',
      this.unit = '',
      this.value = 0})
      : super(key: key);
  final onChanged;
  final String title;
  final String unit;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2a2e31),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: EdgeInsets.only(top: 10, bottom: 15, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${this.value}',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                this.unit,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color.fromARGB(255, 108, 145, 22),
              inactiveTrackColor: Color.fromARGB(255, 208, 241, 133),
              overlayColor: Color.fromARGB(37, 161, 208, 51),
              thumbColor: Color(0xffa0d033),
            ),
            child: Slider(
              value: this.value.toDouble(),
              min: 0.0,
              max: 250.0,
              onChanged: this.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 10,
        color: Color(0xff2a2e31),
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 5,
          bottom: 20,
        ),
        padding: EdgeInsets.only(bottom: 5),
        child: Center(
          child: Text(
            'calculate',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
