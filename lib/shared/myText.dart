import 'package:efood/shared/constants.dart';
import 'package:flutter/material.dart';

class MyTextHeading extends StatelessWidget {
  final String title;
  MyTextHeading({this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title\n',
      style: robotoInput.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MyTextData extends StatelessWidget {
  final String data;
  MyTextData({this.data});
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: robotoInput.copyWith(
        color: Colors.black,
      ),
    );
  }
}

class MyTextSpecificData extends StatelessWidget {
  final String title;
  final String data;

  const MyTextSpecificData({this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: robotoInput.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: data,
            style: robotoInput.copyWith(
              color: Colors.black,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class MyTextInstruction extends StatelessWidget {
  final Size screenSize;
  final String title;
  final String data;

  const MyTextInstruction({this.screenSize, this.title, this.data});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: screenSize.width * .03,
          ),
          width: screenSize.width,
          child: Text(
            title,
            style: robotoInput.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: screenSize.width * .03,
          ),
          width: screenSize.width,
          child: Text(
            '\t\t\t\t$data',
            style: robotoInput.copyWith(
              color: Colors.black,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
