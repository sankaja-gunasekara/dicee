import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange[200],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.deepOrange[300],
        ),
        body: SafeArea(
          child: DicePage(),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1; // need to create only once when the dice page get created.
  int rightDice = 1;

  void numGenerator() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            //flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  onPressed: () {
                    //void callback
                    numGenerator();
                    //print(leftDice);
                  },
                  child: Image.asset(
                      'images/dice$leftDice.png') //New shorter construct
                  ),
            ),
          ),
          Expanded(
            //flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  numGenerator();
                },
                child: Image(
                  image: AssetImage('images/dice$rightDice.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
