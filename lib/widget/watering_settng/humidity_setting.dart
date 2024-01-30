import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class HumiditySetting extends StatefulWidget {
  @override
  _HumiditySettingState createState() => _HumiditySettingState();
}

class _HumiditySettingState extends State<HumiditySetting> {
  double _humiditySliderValue = 50.0; // Use double instead of int
  double _timeSliderValue = 5.0; // Use double instead of int

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_humiditySliderValue.round()}%',
                style: const TextStyle(
                  fontFamily: 'NotoSans',
                  fontSize: 25,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '0',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: _humiditySliderValue,
                        onChanged: (value) {
                          final fb = FirebaseDatabase.instance.ref().child("Setting").update({
                            "Humidity": value
                          });
                          setState(() {
                            _humiditySliderValue = value;
                          });
                        },
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.cyan,
                        inactiveColor: Colors.cyan[100],
                        label: '${_humiditySliderValue.round()}',

                      ),
                    ),
                    const Text(
                      '100',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'ความชื้น',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey[200],
            endIndent: 150,
            indent: 150,
            height: 80,
            thickness: 2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_timeSliderValue.round()} วินาที',
                style: const TextStyle(
                  fontFamily: 'NotoSans',
                  fontSize: 25,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '0',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: _timeSliderValue,
                        onChanged: (value) {
                          final fb = FirebaseDatabase.instance.ref().child("Setting").update({
                            "WateringBatchWait": value
                          });
                          setState(() {
                            _timeSliderValue = value;
                          });
                        },
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.cyan,
                        inactiveColor: Colors.cyan[100],
                        label: '${_timeSliderValue.round()}',

                      ),
                    ),
                    const Text(
                      '120',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'เวลาที่ต้องการรด',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ],
          )
        ]
    );

  }
}
