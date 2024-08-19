import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';

@immutable
class Loginhandle{
final String token ;

  Loginhandle({required this.token});

  const Loginhandle.foobar() : token = "Foobaar";
  @override
  bool operator ==(covariant Loginhandle other) => token == other.token ;
  
  @override
  // TODO: implement hashCode
  int get hashCode => token.hashCode;

  @override
  String toString() => 'Loginhandle (token = $token)';
  }
  
enum Loginerror{
  invalidhandle
}

