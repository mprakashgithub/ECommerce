import 'package:demoapp/homeScreen/login.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  TextStyle style = TextStyle(fontFamily: 'Roboto');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          body: Center(
            child: new Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100),
                
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                        fontSize: 45.0, fontFamily: 'Roboto'),
                                  ),
                                  Text(
                                    "Restaurant",
                                    style: TextStyle(
                                        fontSize: 45.0,
                                        fontWeight: FontWeight.bold
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Text("Welcomes You",
                            style: TextStyle(fontSize: 14)),
                 
                      ],
                    ),
                  ),
                  SizedBox(height:80),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(

                              builder: (context) =>  LoginScreen()// SubmitAttendance()// QRScanner()//LoginScreen()
                          ),
                        );
                      },
                      child: Text(
                        "Let's Go",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}


