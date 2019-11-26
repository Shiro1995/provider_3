
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;


 

// 	Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
//     if (firebaseUser == null) {
//       _status = Status.Unauthenticated;
//     } else {
//       _user = firebaseUser;
//       _status = Status.Authenticated;
//     }
//     notifyListeners();
//   }
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
