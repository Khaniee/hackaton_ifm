import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String objectifPrincipale = "";

  void updateObjectifPrincipale(value) {
    objectifPrincipale = value;
    notifyListeners();
  }
}
