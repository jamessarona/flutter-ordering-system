import 'package:efood/shared/constants.dart';
import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final String message;

  NoDataFound(this.message);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: robotoTitle.copyWith(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }
}
