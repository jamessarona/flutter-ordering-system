import 'package:efood/shared/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Color color;
  final Function onPressed;

  const MyButton({this.name, this.color, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: robotoTitle.copyWith(
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          fontSize: 13,
        ),
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5),
      ),
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  final String name;
  final Color color;
  final Function onPressed;

  const MyFloatingButton({this.name, this.color, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: color,
      child: Text(
        name,
        style: robotoTitle.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    );
  }
}

class MyViewStoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'View Store',
        style: TextStyle(color: Colors.red),
      ),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.red,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
