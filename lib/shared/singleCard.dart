import 'package:efood/shared/constants.dart';
import 'package:efood/shared/myButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleCardFood extends StatelessWidget {
  final Size screenSize;
  final String image;
  final String name;
  final double price;
  final Function onPressedBuy;
  final Function onPressedCart;

  const SingleCardFood({
    this.screenSize,
    this.image,
    this.name,
    this.price,
    this.onPressedBuy,
    this.onPressedCart,
  });
  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,##0.00");
    return Card(
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
        ),
        width: 195,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 145,
              width: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    '$image',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 4,
              ),
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: robotoTitle.copyWith(
                      letterSpacing: 0,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 8,
                    ),
                    width: 170,
                    child: Text(
                      '₱${formatter.format(price)}',
                      style: robotoTitle.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 85,
                    child: MyButton(
                      name: 'Buy Now',
                      color: Colors.green,
                      onPressed: onPressedBuy,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: screenSize.width * .01),
                    width: 70,
                    child: MyButton(
                      name: 'Cart',
                      color: customColors[30],
                      onPressed: onPressedCart,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
