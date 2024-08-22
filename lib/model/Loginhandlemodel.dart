// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';

@immutable
class Loginhandle{
final String token ;

 const Loginhandle({required this.token});

  const Loginhandle.foobar() : token = "Foobaar";
  @override
  bool operator ==(covariant Loginhandle other) => token == other.token ;
  
  @override
  
  int get hashCode => token.hashCode;

  @override
  String toString() => 'Loginhandle (token = $token)';
  }
  
enum Loginerror{
  invalidhandle
}

