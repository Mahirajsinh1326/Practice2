import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Center(child: Text("The Dice")),
        backgroundColor: Colors.blue,
      ),
      body: DicePage(),
    ),
  ));
}



class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) +1;
      rightDiceNumber = Random().nextInt(6)+1;// +1 for convert range from 0 - 5 to 1 - 6
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextButton(
            onPressed: () {
              changeDiceFace();
            },
            child: Image.asset("images/dice$leftDiceNumber.png"),
          )),
          TextButton(onPressed: () {
            setState(() {
              leftDiceNumber = 1;
              rightDiceNumber = 1;
            });
          },

          child: Icon(Icons.restart_alt)),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  child: Image.asset("images/dice$rightDiceNumber.png"))),
        ],
      ),
    );
  }
}
