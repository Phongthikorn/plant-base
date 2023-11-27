import 'package:flutter/material.dart';

class TimeSetting extends StatefulWidget {
  const TimeSetting({Key? key}) : super(key: key);

  @override
  State<TimeSetting> createState() => _TimeSettingState();
}

class _TimeSettingState extends State<TimeSetting> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 15,),
              Text("", style: TextStyle(fontSize: 20)),
              Text(
                "รดน้ำทุก ๆ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontFamily: "NotoSans",
                ),
              ),
           ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "วัน",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontFamily: "NotoSans",
                  ),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 100,
                  width: 50,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 45,
                    perspective: 0.01,
                    diameterRatio: 2.5,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 31,
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            index.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontFamily: "NotoSans",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 15,),
              Text("", style: TextStyle(fontSize: 20)),
              Text(
                "เวลา",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontFamily: "NotoSans",
                ),
              ),
            ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "นาฬิกา",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontFamily: "NotoSans",
                  ),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 100,
                  width: 50,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 45,
                    perspective: 0.01,
                    diameterRatio: 2.5,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            index.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontFamily: "NotoSans",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "นาที",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontFamily: "NotoSans",
                  ),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 100,
                  width: 50,
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (value) => print(value),
                    itemExtent: 45,
                    perspective: 0.01,
                    diameterRatio: 2.5,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            index < 10 ? '0$index' : index.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontFamily: "NotoSans",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
