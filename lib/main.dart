import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_cubit/UI/home_page/home.dart';
import 'package:teste_cubit/cubit/scorebrd_cubit.dart';
import 'package:teste_cubit/data/repositories/score_repositorie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ScorebrdCubit>(
        create: (context) => ScorebrdCubit(scoreRepo: ScoreRepo()),
        child: HomePage(),
      ),
    );
  }
}

