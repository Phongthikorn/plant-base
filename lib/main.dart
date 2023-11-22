import 'package:flutter/material.dart';
import 'core/mqtt_wrapper.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(const CookieClicker());
}

class CookieClicker extends StatefulWidget {
  const CookieClicker({Key? key});

  @override
  State<StatefulWidget> createState() => CookieClickerState();
}

class CookieClickerState extends State<CookieClicker> {
  final MQTTClientWrapper _newClient = MQTTClientWrapper();
  int _cookieCounter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 50.0)),
              OutlinedButton(
                onPressed: () {
                  // TODO: Press Event
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/plant_1.png',
                          width: 48,
                          height: 48,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: const Text('ต้นอะไรเนี่ยย'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/water.png',
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Add your content for the second row here
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: Container(
              height: 4.0,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          title: Container(
            padding: const EdgeInsets.only(top: 8.0),
            child: const Text(
              "Plant-Base",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'K2D',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: GNav(
          tabs: const [
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
          activeColor: Colors.green[700]!,
          iconSize: 26,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.green[500]!,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    );
  }
}
