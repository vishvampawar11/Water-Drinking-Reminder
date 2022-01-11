import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String vol;
  final String drankamount;
  final double amountPctOfTotal;

  ChartBar(this.vol, this.drankamount, this.amountPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 300,
      child: Stack(
        children: [
          Container(
            height: 30,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              color: Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          FractionallySizedBox(
            widthFactor: amountPctOfTotal,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
