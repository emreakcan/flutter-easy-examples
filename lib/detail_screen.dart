import 'package:Shrine/model/User.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final User user;

  DetailScreen({Key key, @required this.user}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Listview"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
      ),
      body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(user.name),
              Text(user.email),
            ],
          ),
      ),
    );
  }
}
