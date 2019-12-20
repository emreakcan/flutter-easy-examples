import 'dart:convert';

import 'package:Shrine/api/Api.dart';
import 'package:Shrine/model/User.dart';
import 'package:flutter/material.dart';


class ApiCall extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => _ApiCallState();

}

class _ApiCallState extends State {
  @override
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
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
                padding: const EdgeInsets.all(24),
                child: Text(users[index].name)
            );
          }
      ),

    );

  }

  var users = new List<User>();

  _getUsers() {
    Api.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

}
