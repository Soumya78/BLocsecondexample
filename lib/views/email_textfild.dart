
import 'package:flutter/material.dart';

class EmailTextfield extends StatelessWidget {
  final TextEditingController emailcontroller;

  const EmailTextfield({super.key, required this.emailcontroller});
   

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: const InputDecoration(hintText:"Enter your email address here " ),
    );
  }
}
