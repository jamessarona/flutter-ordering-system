import 'package:efood/screen/login.dart';
import 'package:efood/shared/constants.dart';
import 'package:efood/shared/myButton.dart';
import 'package:flutter/material.dart';

class MyModalConfirmation extends StatefulWidget {
  final String title;
  final String message;
  final String buttonCancel;
  final String buttonAction;
  final String onPressedCancel;
  final String onPressedAction;

  MyModalConfirmation({
    this.title,
    this.message,
    this.buttonCancel,
    this.buttonAction,
    this.onPressedCancel,
    this.onPressedAction,
  });
  @override
  _MyModalConfirmationState createState() => _MyModalConfirmationState();
}

class _MyModalConfirmationState extends State<MyModalConfirmation> {
  Size screenSize;
  Function _getAction(String method) {
    return () {
      if (method == 'Cancel') {
        Navigator.pop(context);
      } else if (method == 'Signout') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => LogIn(),
          ),
        );
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 10,
            width: screenSize.width * .11,
          ),
          Text(
            widget.title,
            style: robotoTitle.copyWith(
              color: Colors.black,
              letterSpacing: 0,
              fontSize: 16,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: 20.0,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.message,
                style: robotoTitle.copyWith(
                  color: Colors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenSize.height * .05,
              width: screenSize.width * .5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenSize.height * .04,
                    child: MyButton(
                      onPressed: _getAction(widget.onPressedCancel),
                      name: widget.buttonCancel,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: screenSize.height * .04,
                    child: MyButton(
                      onPressed: _getAction(widget.onPressedAction),
                      // onPressed: () {
                      //   Navigator.pop(context);
                      // },
                      name: widget.buttonAction,
                      color: customColors[30],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyModalSuccessMessage extends StatefulWidget {
  final String message;
  final Color bgcolor;
  final Color txtcolor;
  MyModalSuccessMessage({this.message, this.bgcolor, this.txtcolor});
  @override
  _MyModalSuccessMessageState createState() => _MyModalSuccessMessageState();
}

class _MyModalSuccessMessageState extends State<MyModalSuccessMessage> {
  Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: widget.bgcolor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      content: Container(
        height: screenSize.height * .08,
        width: screenSize.width * .6,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.message,
                style: robotoTitle.copyWith(
                  fontSize: 18,
                  color: widget.txtcolor,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ]),
      ),
    );
  }
}
