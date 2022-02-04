import 'package:efood/screen/login.dart';
import 'package:efood/shared/Constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: LogIn(),
      debugShowCheckedModeBanner: false, //remove debug banner
      theme:
          ThemeData(splashColor: Colors.blue, primaryColor: customColors[30]),
    ));
