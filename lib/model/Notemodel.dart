import 'package:flutter/foundation.dart';
@immutable 
class Note{
  final String title ;

  Note({required this.title});

  @override
  String toString() => 'Note (title = $title)';

}
final mockNotes = Iterable.generate(3,(i)=> Note(title: 'Note ${i +1 }'));