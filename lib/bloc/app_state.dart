import 'package:blocproject2/model/Loginhandlemodel.dart';
import 'package:blocproject2/model/Notemodel.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppState {
  final bool isloading;
  final Loginerror? loginerror;
  final Loginhandle? loginhandle;
  final Iterable<Note>? fetchnotes;

  const AppState(
      {required this.isloading,
      required this.loginerror,
      required this.loginhandle,
      required this.fetchnotes});

  const AppState.empty()
      : isloading = false,
        loginerror = null,
        loginhandle = null,
        fetchnotes = null;
}
