// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:Shrine/apicall.dart';
import 'package:Shrine/detail.dart';
import 'package:Shrine/detail_screen.dart';
import 'package:Shrine/model/User.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {

    if(settings.name == '/detail'){
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => DetailPage(),
        fullscreenDialog: true,
      );
    }

    if(settings.name == '/apicall'){
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => ApiCall(),
        fullscreenDialog: true,
      );
    }


    if(settings.name == '/home'){
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => HomePage(),
        fullscreenDialog: true,
      );
    }

    if(settings.name == '/detail_screen'){

      final User user = settings.arguments;

      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => DetailScreen(user: user),
        fullscreenDialog: true,
      );
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

