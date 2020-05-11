import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage('assets/images/kontena2.jpeg'),
//            fit: BoxFit.cover,
//          ),
//        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  color: Colors.blueAccent,
                  child: Text('Log in'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  color: Colors.transparent,
                  child: Text(
                    'Click here to sign up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  color: Colors.transparent,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
