// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
@immutable 
class Note{
  final String title ;

  const Note({required this.title});

  @override
  String toString() => 'Note (title = $title)';

}
final mockNotes = Iterable.generate(3,(i)=> Note(title: 'Note ${i +1 }'));