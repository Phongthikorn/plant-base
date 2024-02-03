import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:plant_base/core/pot_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HumiditySetting extends StatefulWidget {
  @override
  _HumiditySettingState createState() => _HumiditySettingState();
}

class _HumiditySettingState extends State<HumiditySetting> {
  final fb = FirebaseDatabase.instance.ref("Setting");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<PotData>(builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${value.targetHumidity.round()}%',
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
                        value: value.targetHumidity,
                        onChanged: (value) {
                          // final fb = FirebaseDatabase.instance.ref().child("Setting").update({
                          //   "Humidity": value
                          // });
                          final target = context.read<PotData>();
                          target.setTargetHumidity(value);
                        },
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.cyan,
                        inactiveColor: Colors.cyan[100],
                        label: '${value.targetHumidity.round()}',

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
                '${value.targetTime.round()} วินาที',
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
                        value: value.targetTime,
                        onChanged: (value) {
                          // final fb = FirebaseDatabase.instance.ref().child("Setting").update({
                          //   "WateringBatchWait": value
                          // });
                          final target = context.read<PotData>();
                          target.setTargetTime(value);
                        },
                        min: 0,
                        max: 120,
                        divisions: 120,
                        activeColor: Colors.cyan,
                        inactiveColor: Colors.cyan[100],
                        label: '${value.targetTime.round()}',

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
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 30),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                    backgroundColor:  Colors.cyan[300]
                ),
                onPressed: () async {
                  FirebaseDatabase.instance.ref().child("Setting").update({
                    "Humidity": value.targetHumidity,
                    "WateringBatch": value.targetTime,
                  });
                  final potDataProvider = context.read<PotData>();
                  potDataProvider.saveData();
                },
                child: Text("ยืนยันการตั้งค่า"),
              )
            ],
          ),
        ]
    )) ;

  }
}
