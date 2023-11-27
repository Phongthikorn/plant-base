import 'package:flutter/material.dart';


class HumiditySetting extends StatefulWidget {
  @override
  _HumiditySettingState createState() => _HumiditySettingState();
}

class _HumiditySettingState extends State<HumiditySetting> {
  double _sliderValue = 50.0; // Use double instead of int

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${_sliderValue.round()}%',
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
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  min: 0,
                  max: 100,
                  divisions: 100,
                  activeColor: Colors.cyan,
                  inactiveColor: Colors.cyan[100],
                  label: '${_sliderValue.round()}',

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
    );
  }
}