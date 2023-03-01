import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travels/day1/main.dart';
import 'package:travels/day10/bloc/search/search_bloc.dart';

void main() => runApp(Wrapper());

class Wrapper extends StatelessWidget {
  final Widget child;
  Wrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
        ],
        child: MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(subtitle1: TextStyle(textBaseline: TextBaseline.alphabetic)),
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}