//import 'dart:html';

import 'package:flutter/material.dart';
import 'core/mqtt_wrapper.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(CookieClicker());
}

class CookieClicker extends StatefulWidget {
  const CookieClicker({super.key});

  @override
  State<StatefulWidget> createState() => CookieClickerState();
}

class CookieClickerState extends State<CookieClicker> {

  MQTTClientWrapper newClient = MQTTClientWrapper();

  int CookieCounter = 0;

  void _incrementCounter() {
    newClient.prepareMqttClient();
    newClient.publishMessage("pot/redLight");
    setState(() {
      CookieCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(CookieCounter.toString()),
                  ElevatedButton(onPressed: _incrementCounter, child: Text("Increment!"))
                ]
            )
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: Container(
              height: 1.0,
              color: Colors.green.withOpacity(0.5),
            ),
          ),
          title: Text(
            "Home",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        bottomNavigationBar: GNav(
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: "Home",
            ),
            GButton(
              icon: LineIcons.alternateComment,
              text: 'Status',
            ),
            GButton(
              icon: LineIcons.alternateSignIn,
              text: 'Setting',
            ),
          ],
          gap: 16,
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          activeColor: Colors.green[700],
          iconSize: 26,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.green[500],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    );
  }

}