import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosyncapp/service.dart';
class BlackScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _BlackScreen();

}
class _BlackScreen extends State<BlackScreen>{
  final _formKey = GlobalKey<FormState>();
  Service service=new Service();
  MessageOutgoing meso = new MessageOutgoing();
  @override
  Widget build(BuildContext context) {
    meso.text="mess";
    service.send(meso);
    service.startListening();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Mosync"),
      ),
      body: Container(
        child:Column(children: [
          Expanded(
            child: ListView(
              children: [
                Text("1"),
                Text("2"),
              ],
            ),
          ),
          Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      // Process data.
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
        ],),
      ),
    );
  }
}