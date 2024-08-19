import 'package:blocproject2/api/loginapi.dart';
import 'package:blocproject2/api/notesapi.dart';
import 'package:blocproject2/bloc/actions.dart';
import 'package:blocproject2/bloc/app_state.dart';
import 'package:blocproject2/model/Loginhandlemodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appbloc extends Bloc<Appaction, AppState> {
  final LoginApiProtocol loginApiProtocol;
  final NotesapiProtocol notesapiProtocol;
 // Initially the state is empty 
  Appbloc({required this.loginApiProtocol, required this.notesapiProtocol})
      : super(const AppState.empty()) {
        //After Login action intitally its loading 
    on<LoginAction>(
      (event, emit) async {
        emit(
          const AppState(
              isloading: true,
              loginerror: null,
              loginhandle: null,
              fetchnotes: null),
        );
        // Then here is handling the laoding process and if the loginhandle is wrong it will give error
        final loginhandle = await loginApiProtocol.login(
            email: event.email, password: event.password);
        emit(
          AppState(
              isloading: false,
              loginerror: loginhandle == null ? Loginerror.invalidhandle : null,
              loginhandle: loginhandle,
              fetchnotes: null),
        );
      },
    );
    /// Here we invoke fetch notes action and here its loading 
    on<LoadnotesAction>(
      (event, emit) async {
        emit(
          AppState(
              isloading: true,
              loginerror: null,
              loginhandle: state.loginhandle, //We take the handle from the previous state here 
              fetchnotes: null),
        );
        final loginhandle = state.loginhandle;
        if (loginhandle != const Loginhandle.foobar()) {
          emit(
            AppState(
                isloading: false,
                loginerror: Loginerror.invalidhandle,
                loginhandle: loginhandle,
                fetchnotes: null),
          );
        } else {
          final notesloaded =
              await notesapiProtocol.getnotes(loginhandle: loginhandle!);
              emit(
            AppState(
                isloading: false,
                loginerror: null,
                loginhandle: loginhandle,
                fetchnotes: notesloaded),
          );
        }
      },
    );
  }
}
