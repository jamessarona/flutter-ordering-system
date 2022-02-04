import 'dart:async';
import 'dart:convert';
import 'package:efood/shared/constants.dart';
import 'package:efood/shared/myButton.dart';
import 'package:efood/shared/myDrawer.dart';
import 'package:efood/shared/myIcon.dart';
import 'package:efood/shared/myListTile.dart';
import 'package:efood/shared/myModals.dart';
import 'package:efood/shared/mySpinkit.dart';
import 'package:efood/shared/myText.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class DetailFood extends StatefulWidget {
  final String title;
  final String image;
  final Size screenSize;

  final String uname;
  final String uemail;
  final String uimage;
  final String id;
  const DetailFood(
      {this.title,
      this.image,
      this.screenSize,
      this.uname,
      this.uemail,
      this.uimage,
      this.id});
  @override
  _DetailFoodState createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String cocktailUrl =
      'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=';
  Map cocktailData;
  int quantity;
  bool isAddPress = false;
  bool isDeductPress = false;
  final formatter = new NumberFormat("#,##0.00");

  Future<Response> _getResponseData(String url) async {
    Response response = await get(url);
    return response;
  }

  void updateQuantity(String method) {
    if (method == '+') {
      if (quantity < 999) {
        quantity++;
      }
    } else {
      if (quantity > 1) {
        quantity--;
      }
    }
  }

  String _getIngredientsMeasure(String fieldName) {
    String data = '';
    for (int i = 1; i <= 12; i++) {
      if (cocktailData['drinks'][0][fieldName + i.toString()] != null) {
        data += '• ${cocktailData['drinks'][0][fieldName + i.toString()]}\n\n';
      }
    }
    return data;
  }

  String _getSpecificData(String fieldName) {
    String data = '';
    if (cocktailData['drinks'][0][fieldName] != null) {
      data = cocktailData['drinks'][0][fieldName];
    } else {
      data = 'N/A';
    }
    return data;
  }

  double _setTotal(double price, int iquantity) {
    return price * iquantity;
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
    _getResponseData(cocktailUrl + widget.id).then((value) {
      setState(() {
        quantity = 1;
        cocktailData = jsonDecode(value.body);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(
                  FontAwesomeIcons.chevronLeft,
                  size: widget.screenSize.height * .025,
                  color: Colors.blue[100],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.userAlt,
                    size: widget.screenSize.height * .025,
                    color: Colors.blue[100],
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                ),
              ],
              expandedHeight: widget.screenSize.height * .35,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text(
                    widget.title,
                    style: robotoTitle.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                        color: Colors.blue[100]),
                    textAlign: TextAlign.left,
                  ),
                  background: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  )),
            ),
            SliverPadding(
              padding: new EdgeInsets.all(widget.screenSize.height * .005),
            ),
          ];
        },
        body: cocktailData != null
            ? Container(
                width: widget.screenSize.width,
                height: widget.screenSize.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                          color: Colors.blue[50],
                          child: MyListTileStoreInfo(
                            screenSize: widget.screenSize,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: widget.screenSize.height * .02,
                          top: widget.screenSize.height * .02),
                      height: widget.screenSize.height * .12,
                      width: widget.screenSize.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: widget.screenSize.height * .1,
                            width: widget.screenSize.width * .35,
                            child: Text(
                              cocktailData['drinks'][0]['strDrink'],
                              style: robotoTitle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                              maxLines: 3,
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            height: widget.screenSize.height * .07,
                            width: widget.screenSize.width * .35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue[200],
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue[900].withOpacity(0.5),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: InkWell(
                                    highlightColor: customColors,
                                    splashColor: customColors,
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        updateQuantity('-');
                                      });
                                    },
                                  ),
                                  onLongPressStart: (_) async {
                                    isDeductPress = true;
                                    do {
                                      setState(() {
                                        updateQuantity('-');
                                      });
                                      await Future.delayed(
                                          Duration(milliseconds: 1));
                                    } while (isDeductPress);
                                  },
                                  onLongPressEnd: (_) =>
                                      setState(() => isDeductPress = false),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: widget.screenSize.height * .02,
                                  width: widget.screenSize.width * .08,
                                  child: Text(
                                    quantity.toString(),
                                    style: robotoTitle.copyWith(
                                      fontSize: 17,
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: InkWell(
                                    highlightColor: customColors,
                                    splashColor: customColors,
                                    child: Icon(
                                      Icons.add,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        updateQuantity('+');
                                      });
                                    },
                                  ),
                                  onLongPressStart: (_) async {
                                    isAddPress = true;
                                    do {
                                      setState(() {
                                        updateQuantity('+');
                                      });
                                      await Future.delayed(
                                          Duration(milliseconds: 1));
                                    } while (isAddPress);
                                  },
                                  onLongPressEnd: (_) =>
                                      setState(() => isAddPress = false),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 8.0,
                      color: Colors.grey[300],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: widget.screenSize.width * .05,
                        right: widget.screenSize.width * .05,
                        bottom: widget.screenSize.height * .02,
                      ),
                      width: widget.screenSize.width,
                      child: Column(
                        children: [
                          Container(
                              height: widget.screenSize.height * .05,
                              width: widget.screenSize.width,
                              child: Row(
                                children: [
                                  Text(
                                    'Product Details',
                                    style: robotoInput.copyWith(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: widget.screenSize.width * .03,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.clock,
                                    size: widget.screenSize.height * .014,
                                    color: cocktailData['drinks'][0]
                                                ['dateModified'] !=
                                            null
                                        ? Colors.black
                                        : Colors.grey[100],
                                  ),
                                  Container(
                                    width: widget.screenSize.width * .01,
                                  ),
                                  Text(
                                    _getSpecificData('dateModified'),
                                    style: robotoInput.copyWith(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )),
                          Divider(
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: widget.screenSize.width * .03,
                            ),
                            width: widget.screenSize.width,
                            child: MyTextSpecificData(
                              title: 'Category',
                              data: _getSpecificData('strCategory'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: widget.screenSize.width * .03,
                              top: widget.screenSize.height * .005,
                            ),
                            width: widget.screenSize.width,
                            child: MyTextSpecificData(
                              title: 'Alcoholic',
                              data: _getSpecificData('strAlcoholic'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: widget.screenSize.width * .03,
                              top: widget.screenSize.height * .005,
                              bottom: widget.screenSize.height * .01,
                            ),
                            width: widget.screenSize.width,
                            child: MyTextSpecificData(
                              title: 'Glass',
                              data: _getSpecificData('strGlass'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: widget.screenSize.width * .4,
                                child: MyTextHeading(title: 'Ingredients'),
                              ),
                              Container(
                                width: widget.screenSize.width * .4,
                                child: MyTextHeading(
                                  title: 'Measurements',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: widget.screenSize.width * .03),
                                width: widget.screenSize.width * .4,
                                child: MyTextData(
                                  data: _getIngredientsMeasure('strIngredient'),
                                ),
                              ),
                              Container(
                                width: widget.screenSize.width * .4,
                                child: MyTextData(
                                  data: _getIngredientsMeasure('strMeasure'),
                                ),
                              ),
                            ],
                          ),
                          MyTextInstruction(
                            screenSize: widget.screenSize,
                            title: 'Instruction',
                            data: _getSpecificData('strInstructions'),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 8.0,
                      color: Colors.grey[300],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: widget.screenSize.width * .05,
                        right: widget.screenSize.width * .05,
                        bottom: widget.screenSize.height * .02,
                      ),
                      width: widget.screenSize.width,
                      child: Column(
                        children: [
                          Container(
                              height: widget.screenSize.height * .05,
                              width: widget.screenSize.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Product Ratings',
                                        style: robotoInput.copyWith(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height: widget.screenSize.height * .005,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          MyIcon(
                                            screenSize: widget.screenSize,
                                          ),
                                          Container(
                                            width:
                                                widget.screenSize.width * .01,
                                          ),
                                          Text(
                                            '4.5/5',
                                            style: robotoInput.copyWith(
                                              color: Colors.orange,
                                              fontSize: 15,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                          Container(
                                            width:
                                                widget.screenSize.width * .01,
                                          ),
                                          Text(
                                            '(1,525 Reviews)',
                                            style: robotoInput.copyWith(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          'See All',
                                          style: robotoInput.copyWith(
                                            color: Colors.red,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Container(
                                          width: widget.screenSize.width * .01,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.chevronRight,
                                          size: widget.screenSize.height * .014,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : MySpinkitLoadingPage(),
      ),
      endDrawer: MyDrawer(
        uname: widget.uname,
        uemail: widget.uemail,
        uimage: widget.uimage,
        screenSize: widget.screenSize,
      ),
      floatingActionButton: cocktailData != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: widget.screenSize.width * .02,
                    bottom: widget.screenSize.height * .01,
                  ),
                  height: widget.screenSize.height * .05,
                  width: widget.screenSize.width * .5,
                  child: Text(
                    '₱' +
                        formatter.format(_setTotal(
                            double.parse(_getSpecificData('idDrink')),
                            quantity)),
                    style: robotoInput.copyWith(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          bottom: widget.screenSize.height * .001),
                      width: widget.screenSize.width * .5,
                      height: widget.screenSize.height * .08,
                      child: MyFloatingButton(
                        name: 'Buy Now',
                        color: Colors.green,
                        onPressed: () {
                          setState(() {
                            quantity = 1;
                          });
                          _buildModalSuccess(
                            context,
                            'Item Successfully Bought',
                            Colors.green,
                            Colors.white,
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: widget.screenSize.height * .001),
                      width: widget.screenSize.width * .5,
                      height: widget.screenSize.height * .08,
                      child: MyFloatingButton(
                        name: 'Add To Cart',
                        color: customColors[30],
                        onPressed: () {
                          setState(() {
                            quantity = 1;
                          });
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
            )
          : Text(''),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
