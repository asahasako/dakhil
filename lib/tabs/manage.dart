import 'package:flutter/material.dart';

class Manage extends StatefulWidget {
  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage order"),
      ),
      body: Container(
        child: Text("this is manage order tab"),
      ),
    );
  }
}
