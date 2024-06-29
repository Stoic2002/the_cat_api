// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cat_api/bloc/cat/cat_bloc.dart';
import 'package:the_cat_api/data/datasource/api_repository.dart';
import 'package:the_cat_api/ui/cat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CatBloc(repository: ApiRepository()),
        child: CatPage(),
      ),
    );
  }
}
