import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosyncapp/ui/components/EnterCommand.dart';
class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Text("1"),
                Text("2"),
              ],
            ),
          ),
          EnterCommand(),
        ],
      ),
    );
  }
}