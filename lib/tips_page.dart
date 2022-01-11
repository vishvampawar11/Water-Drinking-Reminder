import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  static const routeName = '/tips-page';

  Widget tip(String tip) {
    return Text(
      tip,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 100,
            child: Image.network(
              'https://www.nicepng.com/png/detail/842-8420575_electric-light-bulb-free-tools-and-utensils-icons.png',
            ),
          ),
          SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tip('Drink a glass after waking up in the morning'),
              SizedBox(height: 40),
              tip('Don\'t drink water just after eating'),
              SizedBox(height: 40),
              tip('Always drink water sip-by-sip'),
              SizedBox(height: 40),
              tip('Don\'t drink water while standing'),
              SizedBox(height: 40),
              tip('Drink a glass half an hour before having a meal'),
              SizedBox(height: 40),
              tip('Don\'t drink excessively cold water'),
              SizedBox(height: 40),
              tip('Drink a glass after going to the bathroom'),
            ],
          ),
        ],
      ),
    );
  }
}
