import 'package:blocproject2/model/Loginhandlemodel.dart';
import 'package:blocproject2/model/Notemodel.dart';
import 'package:flutter/foundation.dart' show immutable;
@immutable 
abstract class NotesapiProtocol{
  const NotesapiProtocol();
  Future<Iterable<Note>?>getnotes({required Loginhandle loginhandle});
}

@immutable
class Notesapi implements NotesapiProtocol{
  @override
  Future<Iterable<Note>?> getnotes({required Loginhandle loginhandle})
   => Future.delayed(const Duration(seconds: 2)
  ,()=> loginhandle == const Loginhandle.foobar()? mockNotes : null,);
  }
  

