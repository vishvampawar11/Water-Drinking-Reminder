import 'package:flutter/material.dart';
import 'package:reminder/chart_bar.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  double drankAmount;
  final double vol;

  Chart(this.drankAmount, this.vol);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      elevation: 6,
      margin: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  '${drankAmount.toStringAsFixed(2)} L  ',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' /  ${vol.toStringAsFixed(2)} L',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          ChartBar(
            vol.toStringAsFixed(2),
            drankAmount.toStringAsFixed(2),
            (drankAmount / vol),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
