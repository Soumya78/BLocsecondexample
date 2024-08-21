import 'package:flutter/material.dart';

typedef DailogueOptionBuidler<T> = Map<String, T?> Function();

Future<T?> showgenereicdailogue<T>(
    {required BuildContext context,
    required String title,
    required String content,
    required DailogueOptionBuidler optionbuilder}) {
  final options = optionbuilder();
  return showDialog<T?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: options.keys.map((optionTile){
            final value = options[optionTile];
            return TextButton(onPressed: (){
              if(value != null){
                Navigator.of(context).pop(value);
              }else{
                Navigator.of(context).pop();
              }
            }, child: Text(optionTile));
          }).toList()
            
        );
      });
}
