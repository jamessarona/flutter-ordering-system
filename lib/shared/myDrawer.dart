import 'dart:async';

import 'package:efood/screen/homescreen.dart';
import 'package:efood/screen/otherScreen.dart';
import 'package:efood/shared/myListTile.dart';
import 'package:efood/shared/myModals.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  final String uname;
  final String uemail;
  final String uimage;
  final Size screenSize;
  MyDrawer({this.uname, this.uemail, this.uimage, this.screenSize});

  Future<void> _buildModalChoice(
    BuildContext context,
    String title,
    String message,
    String buttonCancel,
    String buttonAction,
    String onPressedCancel,
    String onPressedAction,
  ) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return MyModalConfirmation(
              title: title,
              message: message,
              buttonCancel: buttonCancel,
              buttonAction: buttonAction,
              onPressedCancel: onPressedCancel,
              onPressedAction: onPressedAction,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(uname),
            accountEmail: Text(uemail),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blue[800],
              backgroundImage: AssetImage('assets/profile.png'),
            ),
          ),
          MyListTileDrawer(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreen(
                    title: 'Home',
                    uname: uname,
                    uemail: uemail,
                    uimage: uimage,
                  ),
                ),
              );
            },
            title: 'Home Page',
            icon: Icon(
              FontAwesomeIcons.home,
              color: Colors.black,
            ),
          ),
          MyListTileDrawer(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => OtherScreen(
                    title: 'My Account',
                    uname: uname,
                    uemail: uemail,
                    uimage: uimage,
                  ),
                ),
              );
            },
            title: 'My Account',
            icon: Icon(
              FontAwesomeIcons.userAlt,
              color: Colors.black,
            ),
          ),
          MyListTileDrawer(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => OtherScreen(
                    title: 'Cart',
                    uname: uname,
                    uemail: uemail,
                    uimage: uimage,
                  ),
                ),
              );
            },
            title: 'Cart',
            icon: Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.black,
            ),
          ),
          Divider(),
          MyListTileDrawer(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => OtherScreen(
                    title: 'Settings',
                    uname: uname,
                    uemail: uemail,
                    uimage: uimage,
                  ),
                ),
              );
            },
            title: 'Settings',
            icon: Icon(
              FontAwesomeIcons.cog,
              color: Colors.black,
            ),
          ),
          MyListTileDrawer(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => OtherScreen(
                    title: 'About',
                    uname: uname,
                    uemail: uemail,
                    uimage: uimage,
                  ),
                ),
              );
            },
            title: 'About',
            icon: Icon(
              FontAwesomeIcons.info,
              color: Colors.black,
            ),
          ),
          MyListTileDrawer(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => OtherScreen(
                    title: 'Help',
                    uname: uname,
                    uemail: uemail,
                    uimage: uimage,
                  ),
                ),
              );
            },
            title: 'Help',
            icon: Icon(
              FontAwesomeIcons.question,
              color: Colors.black,
            ),
          ),
          MyListTileDrawer(
            onTap: () {
              Navigator.pop(context);
              _buildModalChoice(
                context,
                'Confirmation',
                'Tap Confirm to Signout',
                'Cancel',
                ' Confirm',
                'Cancel',
                'Signout',
              );
            },
            title: 'Sign Out',
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
