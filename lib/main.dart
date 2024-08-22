import 'package:blocproject2/api/loginapi.dart';
import 'package:blocproject2/api/notesapi.dart';
import 'package:blocproject2/bloc/actions.dart';
import 'package:blocproject2/bloc/app_bloc.dart';
import 'package:blocproject2/bloc/app_state.dart';
import 'package:blocproject2/dailog/generic_dailogue.dart';
import 'package:blocproject2/dailog/loading_screen.dart';
import 'package:blocproject2/strings.dart';
import 'package:blocproject2/views/iterable_list_view.dart';

import 'package:blocproject2/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          Appbloc(loginApiProtocol: Loginapi(), notesapiProtocol: Notesapi()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(homepage),
        ),
        body: BlocConsumer<Appbloc, AppState>(builder: (context, state) {
          final notes = state.fetchnotes;
          if(notes == null){
            return LoginView(onLogintapped:(email , password){
              context.read<Appbloc>().add(LoginAction(email: email, password: password));
            } );
          }else{
            return notes.toListView();
          }
        }, listener: (context, state) {
          //loading screen
          if (state.isloading) {
            LoadingScreen.instance().show(context: context, text: Pleasewait);
          } else {
            LoadingScreen.instance().hide();
          }
          //display possible errors
          final loginerror = state.loginerror;
          print(loginerror);

          if (loginerror == null) {

            showgenereicdailogue(
                context: context,
                title: LoginerrorDailogContent,
                content: LoginerrorDailogContent,
                optionbuilder: () => {ok: true});
          }

          if (state.isloading == false &&
              state.loginerror == null &&
              state.fetchnotes == null) {
            context.read<Appbloc>().add(LoadnotesAction());
          }
        }),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
