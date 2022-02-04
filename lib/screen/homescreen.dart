import 'dart:async';
import 'dart:convert';
import 'package:efood/screen/detailFood.dart';
import 'package:efood/shared/appBar.dart';
import 'package:efood/shared/constants.dart';
import 'package:efood/shared/myDrawer.dart';
import 'package:efood/shared/myModals.dart';
import 'package:efood/shared/mySpinkit.dart';
import 'package:efood/shared/singleCard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final String uname;
  final String uemail;
  final String uimage;
  HomeScreen({this.title, this.uname, this.uemail, this.uimage});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size screenSize;
  Map drinksData;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String drinksUrl =
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic';

  Future<Response> _getResponseData(String url) async {
    Response response = await get(url);
    return response;
  }

  Future<void> _buildModalSuccess(BuildContext context, String message,
      Color bgColor, Color txtColor) async {
    Timer _timer;
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        _timer = Timer(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return WillPopScope(
          onWillPop: () async => true,
          child: MyModalSuccessMessage(
            message: message,
            bgcolor: bgColor,
            txtcolor: txtColor,
          ),
        );
      },
    ).then((value) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  @override
  void initState() {
    _getResponseData(drinksUrl).then((value) {
      setState(() {
        drinksData = jsonDecode(value.body);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue[50],
      appBar: MyAppBar(
        leading: null,
        action: IconButton(
          icon: Icon(
            FontAwesomeIcons.userAlt,
            size: 25,
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
      body: drinksData != null
          ? Container(
              padding: EdgeInsets.only(
                top: 5,
              ),
              height: screenSize.height,
              width: screenSize.width,
              child: ListView(
                shrinkWrap: true,
                dragStartBehavior: DragStartBehavior.start,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceEvenly,
                    children: <Widget>[
                      for (var item in drinksData['drinks'])
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => DetailFood(
                                  screenSize: screenSize,
                                  uname: widget.uname,
                                  uemail: widget.uemail,
                                  uimage: widget.uimage,
                                  image: item['strDrinkThumb'],
                                  title: item['strDrink'],
                                  id: item['idDrink'],
                                ),
                              ),
                            );
                          },
                          child: SingleCardFood(
                            screenSize: screenSize,
                            image: item['strDrinkThumb'],
                            name: item['strDrink'],
                            price: double.parse(item['idDrink']),
                            onPressedBuy: () {
                              _buildModalSuccess(
                                context,
                                'Item Successfully Bought',
                                Colors.green,
                                Colors.white,
                              );
                            },
                            onPressedCart: () {
                              _buildModalSuccess(
                                context,
                                'Item Added To Cart',
                                customColors[30],
                                Colors.blue[100],
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            )
          : MySpinkitLoadingPage(),
    );
  }
}
