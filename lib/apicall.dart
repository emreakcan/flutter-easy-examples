import 'dart:convert';

import 'package:Shrine/api/Api.dart';
import 'package:Shrine/model/User.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';



class ApiCall extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => _ApiCallState();

}

class _ApiCallState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Grid"),
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
      body: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 4.0,
        children: _buildGridCards(context),
      ),
      resizeToAvoidBottomInset: false,
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

  List<Text> _buildGridCards(BuildContext context) {
    if (users == null || users.isEmpty) {
      return const <Text>[];
    }

    final ThemeData theme = Theme.of(context);

    return users.map((product) {
      return Text(
        product.email,
        style: theme.textTheme.body2,
      );
    }).toList();
  }


}
