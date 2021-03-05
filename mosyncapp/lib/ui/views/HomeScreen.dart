import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosyncapp/ui/components/EnterCommand.dart';
class Homescreen extends StatelessWidget{
  final List<String> list = ["abc","abads"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) => _makeElement(index),
            ),
          ),
          EnterCommand(),
        ],
      ),
    );
  }
  Widget _makeElement(int index){
    if (index >= list.length) {
      return null;
    }
    return Text(list[index]);
}
}