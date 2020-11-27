import 'dart:convert';
import 'package:demoapp/homeScreen/loginOtp.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   bool isLoading;

  RegExp regex = new RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp regex1 = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp regex2 = new RegExp(
      r'^([a-zA-Z])[a-zA-Z_-]*[\w_-]*[\S]$|^([a-zA-Z])[0-9_-]*[\S]$|^[a-zA-Z]*[\S]$');
String mobno;
  @override
  initState() {
    mobno = "";
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          body: Stack(children: <Widget>[
            new Center(
              child: new SingleChildScrollView(
                child: new Container(
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.only(top: 0, bottom: 50),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 160),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                // height: 60,
                                // width: 250,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "ABC",
                                        style: TextStyle(
                                            fontSize: 45.0, fontFamily: 'Roboto'
                                            // color: Colors.purple[800],
                                            ),
                                      ),
                                      Text(
                                        "Restaurant",
                                        style: TextStyle(
                                            fontSize: 45.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                         

                              SizedBox(height: 40),

                              Container(
                                // height: 60,
                                width: 250,
                                child: Center(
                                    child: Text(
                                  "Login to your account",
                                  style: TextStyle(
                                      fontSize: 14.0, fontFamily: 'Roboto'),
                                )),
                              ),
                              SizedBox(height: 20),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  // initialValue:
                                   inputFormatters: [
                                   LengthLimitingTextInputFormatter(10),
                                   ],
                                   decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.phone_android),
                                    hintText: 'Enter Mobile Number',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple[800]),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple[800]),
                                    ),
                                  ),
                                  onChanged: (input) {
                                    setState(() {
                                      mobno = input;
                                    });
                                  },
                                ),
                              ),

                              SizedBox(
                                height: 80.0,
                              ),
                              !isLoading
                                  ?
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(5)),
                                child: FlatButton(
                                  onPressed: () async {
                                    if (mobno.isEmpty) {
                                      showInDialog(context, "Error",
                                          "Please Enter Phone number!");
                                    } else if (mobno.length != 10) {
                                      showInDialog(context, "Error",
                                          "Please enter valid phone number!");
                                    } else {
                                        setState(() {
                                          isLoading = true;
                                        });
                             

                       

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => VerifyOTP()),
                                      );

                                      
                                    }
                                  },
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              )
                                : Container(
                                  transform: Matrix4.translationValues(
                                      0.0, -10.0, 0.0),
                                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  height: 40,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  void showInDialog(BuildContext context, String title, String value) async {
    showDialog(
      context: context,
      child: new AlertDialog(
        title: Text(title),
        content: Text(value),
        actions: [
          new FlatButton(
            child: const Text("Ok"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
