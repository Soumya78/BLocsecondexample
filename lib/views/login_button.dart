import 'package:blocproject2/dailog/generic_dailogue.dart';
import 'package:blocproject2/strings.dart';
import 'package:flutter/material.dart';
typedef OnLogintapped = void Function(String email, String password);

class LoginButton extends StatelessWidget {
  final TextEditingController emailcontroller ;
  final TextEditingController passwordcontroller;
  final OnLogintapped onLogintapped ;
  
  const  LoginButton({super.key, required this.emailcontroller, required this.passwordcontroller, required this.onLogintapped});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
     if(emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty){
       print(emailcontroller.text);
       print(passwordcontroller.text);
      showgenereicdailogue(context: context, 
      title: emailidorpasswordEmptydailogtitle,
       content: emailorpasswordEmptydescription, 
       optionbuilder: ()=>{ok:true},
       );
    }
    else{
      onLogintapped(emailcontroller.text.toString()
      ,passwordcontroller.text.toString(),
      );
    }
    }, child: const Text(login));
  }
}