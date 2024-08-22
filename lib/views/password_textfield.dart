
import 'package:flutter/material.dart';

class PasswordTextfield extends StatelessWidget {
  final TextEditingController passwordcontroller;

  const PasswordTextfield({super.key, required this.passwordcontroller});
   

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordcontroller,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration:const  InputDecoration(hintText:"Enter your password here " ),
    );
  }
}
