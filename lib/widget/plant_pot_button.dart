import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:plant_base/utils/page_provider.dart';
import 'package:provider/provider.dart';

class PlantPotButton extends StatefulWidget {

  const PlantPotButton({super.key});

  @override
  State<PlantPotButton> createState() => _PlantPotButtonState();
}

class _PlantPotButtonState extends State<PlantPotButton> {

  final fb = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(builder: (context, value, child) => OutlinedButton(
      onPressed: () {
        final pageProvider = context.read<PageProvider>();
        pageProvider.selectPage(2);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.green),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide.none, // Set border side to none
          ),
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: const Text(
                    "ต้นไม้",
                    style: TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 15
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.175,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Image.asset('assets/watering-3.png', width: 25, height: 25),
            //           const Text(
            //             "1 ชม.",
            //             style: TextStyle(
            //                 fontFamily: "NotoSans",
            //                 fontSize: 15
            //             ),
            //           )
            //         ],
            //       ),
            //       SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Image.asset('assets/humidity.png', width: 25, height: 25),
            //           const Text(
            //             '',
            //             style: TextStyle(
            //                 fontFamily: "NotoSans",
            //                 fontSize: 15
            //             ),
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ),);
  }
}

