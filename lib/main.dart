import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_base/pages/pot_setting.dart';
import 'package:plant_base/utils/page_provider.dart';
import 'package:provider/provider.dart';
import 'core/mqtt_wrapper.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'widget/plant_pot_button.dart';
import 'package:plant_base/pages/home.dart';
import 'package:plant_base/pages/status.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
        create: (context) => PageProvider(),
        child: const PlantBase()
    )
  );
}

class PlantBase extends StatefulWidget {
  const PlantBase({Key? key});

  @override
  State<StatefulWidget> createState() => PlantBaseState();
}

class PlantBaseState extends State<PlantBase> {
  final MQTTClientWrapper _newClient = MQTTClientWrapper();
  int _index = 0;
  final pages = [const HomePage(), const StatusPage(), const PotSettingPage()];

  void setPage(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(builder: (context, value, child) => MaterialApp(
      home: Scaffold(
        body: pages[value.pageIndex.toInt()],
        backgroundColor: Colors.grey[50],
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
                color: Colors.green,
                fontSize: 20,
                fontFamily: 'K2D',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: GNav(
          backgroundColor: Colors.white,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: "Home",
            ),
            GButton(
              icon: LineIcons.alternateComment,
              text: 'Status',
            ),
          ],
          onTabChange: (index) {
            final pageProvider = context.read<PageProvider>();
            pageProvider.selectPage(index);
          },
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
    ),);
  }
}
