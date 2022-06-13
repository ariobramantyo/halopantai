import 'package:flutter/foundation.dart';

class NavBarController with ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
