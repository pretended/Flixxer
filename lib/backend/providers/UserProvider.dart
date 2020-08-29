import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  User _user;

  AuthMethods _authMethods = AuthMethods();

  User get getUser => _user;

  reset() async {
    _user = null;
  }

  Future<void> refreshUser() async {
    FirebaseUser firebaseUser = await _authMethods.getCurrentUser();
    _user = await _authMethods.getUserDetails(firebaseUser.uid);
    print('[user-provider] ' + _user.name);

    notifyListeners();
  }
}