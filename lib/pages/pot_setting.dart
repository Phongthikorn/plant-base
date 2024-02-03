import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plant_base/core/pot_data.dart';
import 'package:plant_base/widget/EspCamera.dart';
import 'package:plant_base/widget/watering_settng/humidity_setting.dart';
import 'package:plant_base/widget/watering_settng/time_setting.dart';
import 'package:plant_base/widget/watering_settng/timer_setting.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PotSettingPage extends StatefulWidget {

  const PotSettingPage({super.key});

  @override
  State<PotSettingPage> createState() => _PotSettingPageState();
}

class _PotSettingPageState extends State<PotSettingPage> {

  final fb = FirebaseDatabase.instance.ref();
  int _humidity = 50;
  int _level = 0;
  int _pageIndex = 0;
  String? value = "Humidity";
  bool isSwitched = false;

  final settingWidget = [HumiditySetting(), const TimeSetting(), const TimerSetting()];

  @override
  void initState() {
    super.initState();
    _activeListeners();
  }

  void _activeListeners() {
    fb.child('Status/Humidity').onValue.listen((event) {
      final String currentHumidity = event.snapshot.value.toString();

      setState(() {
        _humidity = int.parse(currentHumidity);
      });
    });
    fb.child('Status/Level').onValue.listen((event) {
      final String currentLevel = event.snapshot.value.toString();
      int toSet = int.parse(currentLevel);
      if (toSet <= 100 && toSet >= 0) {
        setState(() {
          _level = int.parse(currentLevel);
        });
      }


    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<PotData>(builder: (context, value, child) => SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          const Text(
            "สถานะของกระถาง",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 20,
              color: Colors.cyan,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                //animation: true,
                //animationDuration: 1000,
                radius: 80,
                lineWidth: 12,
                percent: _humidity/100,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_humidity}%',
                      style: TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 28,
                        color: Colors.cyan,
                      ),
                    ),

                    Text(
                      "ความชื้น",
                      style: TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 15,
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
                progressColor: Colors.cyan,
                backgroundColor: Colors.cyan.shade100,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              CircularPercentIndicator(
                radius: 80,
                lineWidth: 12,
                percent: _level/100,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_level}%',
                      style: TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 30,
                        color: Colors.cyan,
                      ),
                    ),
                    Text(
                      "ระดับน้ำที่\nเหลืออยู่",
                      style: TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 13,
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
                progressColor: Colors.cyan,
                backgroundColor: Colors.cyan.shade100,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
          Divider(
            color: Colors.grey[300],
            endIndent: 60,
            indent: 60,
            height: 80,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "รดน้ำทันที",
                style: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 30),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                    backgroundColor:  Colors.cyan[300]
                ),
                onPressed: () {
                  fb.child("Setting").update({
                    "InstantWatering": 1,
                  });
                },
                child: Text("รดน้ำ"),
              )
            ],
          ),
          Divider(
            color: Colors.grey[300],
            endIndent: 60,
            indent: 60,
            height: 80,
            thickness: 2,
          ),
          const Text(
            "การตั้งค่าการรดน้ำ",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "การรดน้ำ",
                style: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  int boolean = value == true ? 1 : 0;
                  fb.child("Setting").update({
                    "IsEnableWatering": boolean,
                  });

                  setState(() {
                    isSwitched = value;
                  });
                },
                activeColor: Colors.cyan,
                activeTrackColor: Colors.cyan[100],
              )
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Text(
          //       "การรดน้ำ",
          //       style: TextStyle(
          //         fontFamily: "NotoSans",
          //         fontSize: 20,
          //         color: Colors.green,
          //       ),
          //     ),
          //     SizedBox(width: MediaQuery.of(context).size.width * 0.06, height:MediaQuery.of(context).size.height * 0.1 ,),
          //     Container(
          //       width: 200,
          //       decoration: BoxDecoration(
          //         border: Border.all(color: Colors.cyan, width: 1),
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: DropdownButton<String>(
          //         value: value,
          //         isExpanded: true,
          //         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
          //         borderRadius: BorderRadius.circular(20),
          //         underline: Container(),
          //         onChanged: (String? value) {
          //           setState(() {
          //             this.value = value;
          //             switch (this.value) {
          //               case "Humidity":
          //                 _pageIndex = 0;
          //                 break;
          //               case "Time":
          //                 _pageIndex = 1;
          //                 break;
          //               case "Timer":
          //                 _pageIndex = 2;
          //                 break;
          //             }
          //           });
          //         },
          //         items: const [
          //           DropdownMenuItem<String>(
          //             value: "Humidity",
          //             child: Text(
          //               "ความชื้น",
          //               style: TextStyle(
          //                 fontFamily: "NotoSans",
          //                 fontSize: 16,
          //                 color: Colors.cyan
          //               ),
          //             ),
          //           ),
          //           DropdownMenuItem<String>(
          //             value: "Time",
          //             child: Text(
          //               "เวลาที่กำหนด",
          //               style: TextStyle(
          //                   fontFamily: "NotoSans",
          //                   fontSize: 16,
          //                   color: Colors.cyan
          //               ),
          //             ),
          //           ),
          //           DropdownMenuItem<String>(
          //             value: "Timer",
          //             child: Text(
          //               "จับเวลา",
          //               style: TextStyle(
          //                   fontFamily: "NotoSans",
          //                   fontSize: 16,
          //                   color: Colors.cyan
          //               ),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          Divider(
            color: Colors.grey[200],
            endIndent: 150,
            indent: 150,
            height: 30,
            thickness: 2,
          ),
          Container(
            child: settingWidget[_pageIndex],
          ),

          Divider(
            color: Colors.grey[300],
            endIndent: 60,
            indent: 60,
            height: 80,
            thickness: 2,
          ),

          const Text(
            "วีดีโอ",
            style: TextStyle(
              fontFamily: "NotoSans",
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          // EspCamera(channel: IOWebSocketChannel.connect('ws://35.240.210.6:65080'))
        ],
      ),
    )) ;
  }

}