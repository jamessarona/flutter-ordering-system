import 'package:efood/shared/constants.dart';
import 'package:efood/shared/myButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyListTileDrawer extends StatelessWidget {
  final Function onTap;
  final String title;
  final Icon icon;

  const MyListTileDrawer({this.onTap, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: robotoTitle.copyWith(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
              letterSpacing: 0),
        ),
      ),
    );
  }
}

class MyListTileStoreInfo extends StatelessWidget {
  final Size screenSize;

  const MyListTileStoreInfo({this.screenSize});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[800],
        child: Icon(
          FontAwesomeIcons.userNinja,
          size: screenSize.height * .02,
          color: Colors.white,
        ),
      ),
      title: Text('alcohol.ph'),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Active 54 minutes ago',
            style: robotoContent.copyWith(letterSpacing: 0, fontSize: 10),
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.streetView,
                size: screenSize.height * .015,
                color: Colors.grey,
              ),
              Container(
                width: screenSize.width * .01,
              ),
              Text(
                'Davao, Philippines',
                style: robotoContent.copyWith(letterSpacing: 0, fontSize: 10),
              ),
            ],
          )
        ],
      ),
      trailing: MyViewStoreButton(),
    );
  }
}
