import 'package:efood/screen/homescreen.dart';
import 'package:efood/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var controller = TextEditingController();

// ignore: must_be_immutable
class LogIn extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String regEx =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  bool obserText = true;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [customColors[10], customColors[20]]),
            ),
          ),
          Form(
            key: _formKey,
            child: Positioned(
              top: screenSize.height * .12,
              left: screenSize.width * .1,
              child: Container(
                width: screenSize.width * .8,
                height: screenSize.height * .8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [customColors[30], customColors[30]]),
                  boxShadow: [
                    BoxShadow(
                      color: customColors[40].withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.1,
                        vertical: screenSize.height * .05),
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "TDP Drink \nStore",
                          style: robotoTitle,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Text(
                          "Signin to Continue",
                          style: robotoDesc,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenSize.height * .04),
                            Container(
                              child: TextFormField(
                                controller: controller,
                                validator: (value) {
                                  if (value == '') {
                                    return 'Please Fill Email';
                                  } else if (!RegExp(regEx).hasMatch(value)) {
                                    return 'Invalid Email';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  email = value;
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: robotoInput,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: robotoInput.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[400]),
                                  ),
                                  helperStyle: robotoDesc.copyWith(fontSize: 9),
                                  suffixIcon: IconButton(
                                    onPressed: () => controller.clear(),
                                    icon: Icon(Icons.clear),
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            Container(
                              child: TextFormField(
                                obscureText: true,
                                style: robotoInput,
                                validator: (value) {
                                  if (value == '') {
                                    return 'Please Fill Password';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: robotoInput.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * .03,
                            ),
                            ButtonTheme(
                              minWidth: 260,
                              height: 40,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (ctx) => HomeScreen(
                                            title: 'Home',
                                            uname: 'James Angelo C. Sarona',
                                            uemail: email,
                                            uimage:
                                                'https://static.wikia.nocookie.net/half-life/images/6/62/Gaben.jpg/revision/latest?cb=20200126040848&path-prefix=en'),
                                      ),
                                    );
                                  }
                                },
                                color: customColors[50],
                                textColor: Colors.white,
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("SignIn",
                                              style: TextStyle(
                                                fontSize: 14,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * .01,
                            ),
                            Text(
                              "OR",
                              style: robotoContent,
                            ),
                            SizedBox(
                              height: screenSize.height * .012,
                            ),
                            ButtonTheme(
                              minWidth: 1200,
                              height: 40,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.black,
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Icon(
                                                FontAwesomeIcons.facebookF,
                                                color: Colors.indigo[700],
                                                size: 20),
                                          ),
                                          SizedBox(
                                            width: screenSize.width * .07,
                                          ),
                                          Container(
                                            child: Text("Login with Facebook",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.12,
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'New User?',
                                        style: robotoContent.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenSize.width * 0.02,
                                      ),
                                      Text('Create Account',
                                          style: robotoContent.copyWith(
                                              fontSize: 12,
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.04,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "By tapping Continue, Create or Login,",
                                        style: robotoContent.copyWith(
                                            fontSize: 9, letterSpacing: 0),
                                      ),
                                      Text(
                                        "You agree to Brand's Terms of Service and Privacy Policy",
                                        style: robotoContent.copyWith(
                                            fontSize: 9, letterSpacing: 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
