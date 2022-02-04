import 'package:efood/shared/appBar.dart';
import 'package:efood/shared/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OtherScreen extends StatefulWidget {
  final String title;
  final String uname;
  final String uemail;
  final String uimage;
  OtherScreen({
    this.title,
    this.uname,
    this.uemail,
    this.uimage,
  });
  @override
  _OtherScreenState createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue[50],
      appBar: MyAppBar(
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: screenSize.height * .025,
            color: Colors.blue[100],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        action: IconButton(
          icon: Icon(
            FontAwesomeIcons.userAlt,
            size: screenSize.height * .025,
            color: Colors.blue[100],
          ),
          onPressed: () {
            _scaffoldKey.currentState.openEndDrawer();
          },
        ),
        title: widget.title,
      ),
      endDrawer: MyDrawer(
        uname: widget.uname,
        uemail: widget.uemail,
        uimage: widget.uimage,
        screenSize: screenSize,
      ),
    );
  }
}
