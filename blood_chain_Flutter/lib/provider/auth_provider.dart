import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedInUser {
  final String username;

  LoggedInUser(this.username);
}

class AuthProvider extends ChangeNotifier {
  LoggedInUser? _user;
  final String _userKey = 'loggedInUser';

  LoggedInUser? get user => _user;

  AuthProvider() {
    _loadUserFromPrefs();
  }

  void login(String username) {
    _user = LoggedInUser(username);
    _saveUserToPrefs();
    notifyListeners();
  }

  void logout() {
    _user = null;
    _removeUserFromPrefs();
    notifyListeners();
  }

  Future<void> _saveUserToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, _user!.username);
  }

  Future<void> _loadUserFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString(_userKey);
    if (username != null) {
      _user = LoggedInUser(username);
      notifyListeners();
    }
  }

  Future<void> _removeUserFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
