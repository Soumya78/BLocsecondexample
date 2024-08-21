import 'package:blocproject2/model/Loginhandlemodel.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();
  Future<Loginhandle?> login(
      {required String email, required String password}) {
    throw UnimplementedError();
  }
}

class Loginapi implements LoginApiProtocol {
  // const Loginapi._sharedInstance();
  // static const Loginapi _shared = Loginapi._sharedInstance();
  // factory Loginapi.instance() => _shared;
  @override
  Future<Loginhandle?> login(
          {required String email, required String password}) =>
      Future.delayed(
        const Duration(seconds: 2),
        () => email == 'foorbar.com' && password == 'foobar',
      ).then((isloggedin) => isloggedin ? const Loginhandle.foobar() : null);
}
