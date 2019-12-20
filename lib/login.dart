import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(6),
                    child: RaisedButton(
                      child: Text('Api call and populate list', textAlign: TextAlign.center),
                      onPressed: () {
                        Navigator.pushNamed(context, '/apicall');
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(6),
                    child: RaisedButton(
                      child: Text('Navigation bar and viewpager sample'),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('NEXT'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                    FlatButton(
                      child: Text('CANCEL'),
                      onPressed: () {
                        _usernameController.clear();
                        _passwordController.clear();

                        Navigator.pushNamed(context, '/detail');
                      },
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();

                    Navigator.pushNamed(context, '/detail');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
