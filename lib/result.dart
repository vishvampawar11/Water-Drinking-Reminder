import 'package:flutter/material.dart';
import 'package:reminder/tabs_page.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'DONE!';
    resultText =
        'You sholud drink at least ${(resultScore / 33.814).toStringAsFixed(2)} liters of water everyday';
    return resultText;
  }

  void toHomePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      TabPage.routeName,
      arguments: resultScore,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            height: 150,
            width: 300,
            child: Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: resetHandler,
                child: Text(
                  'Try Again',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () => toHomePage(context),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Container(
            height: 200,
            child: Image.network(
                'https://images-eu.ssl-images-amazon.com/images/I/61UhsQE5xOL.png'),
          ),
        ],
      ),
    );
  }
}
