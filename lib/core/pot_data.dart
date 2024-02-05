import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PotData extends ChangeNotifier {
  double _targetHumidity = 50;
  double _targetTime = 10;
  bool _isEnable = false;
  double get targetHumidity => _targetHumidity;
  double get targetTime => _targetTime;
  bool get isEnable => _isEnable;

  void setTargetHumidity(double target) {
    _targetHumidity = target;
    notifyListeners();
  }

  void setTargetTime(double target) {
    _targetTime = target;
    notifyListeners();
  }

  void setEnable(bool target) {
    _isEnable = target;
    notifyListeners();
  }

  Future<void> setupData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _targetHumidity = prefs.getDouble('targetHumidity') ?? 50;
    _targetTime = prefs.getDouble('targetTime') ?? 50;
    _isEnable = prefs.getBool('isEnable') ?? false;
    notifyListeners();
    print("Hello");
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('targetHumidity', targetHumidity);
    prefs.setDouble('targetTime', targetTime);
    _targetTime = prefs.getDouble('targetTime') ?? 50;
    notifyListeners();
  }
}