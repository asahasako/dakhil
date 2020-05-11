import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pword = TextEditingController();
  String msg = '';
  bool _isHidden = true;

  Future<List> _login() async {
    final response = await http.post("http://10.0.2.2/dakhil/login.php", body: {
      "username": user.text,
      "password": pword.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login failed";
      });
    } else {
      print("Welcome user");
      Navigator.pushReplacementNamed(context, '/home');
    }

    return datauser;
  }

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/images/logo.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextField(
                      controller: user,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: 'Enter your email here...',
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: pword,
                    obscureText: _isHidden,
                    //disable copy paste function (just for password)
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: _isHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: _toggleVisibility),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  RaisedButton.icon(
                    onPressed: () {
                      _login();
                    },
                    label: Text('Login'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blue[400],
                    icon: Icon(
                      Icons.arrow_forward,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                  Text(
                    msg,
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    color: Colors.transparent,
                    child: Text(
                      'Click here to sign up',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    color: Colors.transparent,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
