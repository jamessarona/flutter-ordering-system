import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyIcon extends StatelessWidget {
  final Size screenSize;

  const MyIcon({
    this.screenSize,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.star,
          size: screenSize.height * .014,
          color: Colors.orange,
        ),
        Icon(
          FontAwesomeIcons.star,
          size: screenSize.height * .014,
          color: Colors.orange,
        ),
        Icon(
          FontAwesomeIcons.star,
          size: screenSize.height * .014,
          color: Colors.orange,
        ),
        Icon(
          FontAwesomeIcons.star,
          size: screenSize.height * .014,
          color: Colors.orange,
        ),
        Icon(
          FontAwesomeIcons.starHalf,
          size: screenSize.height * .014,
          color: Colors.orange,
        ),
      ],
    );
  }
}
