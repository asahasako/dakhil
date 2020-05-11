import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sign up')),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your username'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter something here';
                    } else
                      return null;
                  },
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Enter your email here...', labelText: "hello"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  label: Text('Login'),
                  icon: Icon(
                    Icons.arrow_forward,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
