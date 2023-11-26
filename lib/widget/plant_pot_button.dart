import 'package:flutter/material.dart';

class PlantPotButton extends StatefulWidget {

  const PlantPotButton({super.key});

  @override
  State<PlantPotButton> createState() => _PlantPotButtonState();
}

class _PlantPotButtonState extends State<PlantPotButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {

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
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: const Text(
                    "ต้นอะไรเนี่ยยยยยยยยยยยยยยยยยยยยยยยยยยยยย",
                    style: TextStyle(
                      fontFamily: "NotoSans",
                      fontSize: 15
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.175,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/watering-3.png', width: 25, height: 25),
                      Text(
                        "1 ชม.",
                        style: TextStyle(
                          fontFamily: "NotoSans",
                            fontSize: 15
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/humidity.png', width: 25, height: 25),
                      Text(
                          "23%",
                          style: TextStyle(
                            fontFamily: "NotoSans",
                            fontSize: 15
                          ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
