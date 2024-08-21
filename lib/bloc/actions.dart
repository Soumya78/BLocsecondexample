import 'package:flutter/foundation.dart' show immutable;
@immutable 
abstract class Appaction {
  const Appaction();
}

@immutable 
class LoginAction implements Appaction{
  final String email;
  final String password ;

 const  LoginAction({required this.email, required this.password});
}
@immutable 
class LoadnotesAction implements Appaction{

}