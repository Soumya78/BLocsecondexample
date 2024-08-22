import 'package:blocproject2/views/email_textfild.dart';
import 'package:blocproject2/views/login_button.dart';
import 'package:blocproject2/views/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginView extends HookWidget {
  final OnLogintapped onLogintapped;
   const LoginView({super.key, required this.onLogintapped});

  @override
  Widget build(BuildContext context) {
    final emailcontroller = useTextEditingController();
    final passwordcontroller = useTextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          EmailTextfield(emailcontroller: emailcontroller),
          PasswordTextfield(passwordcontroller: passwordcontroller),
          LoginButton(
              emailcontroller: emailcontroller,
              passwordcontroller: passwordcontroller,
              onLogintapped: onLogintapped)
        ],
      ),
    );
    
  }
}
