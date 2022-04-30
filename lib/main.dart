import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qube_health_assignment/Services/repository.dart';
import 'package:qube_health_assignment/bloc/userfeeling_bloc.dart';
import 'package:qube_health_assignment/views/screens/feeling_screen.dart';

import 'autolayou.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) =>
              UserfeelingBloc(activityRepository: ActivityRepository()),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return OrientationBuilder(builder: ((context, orientation) {
                GridUtil().init(constraints, orientation);
                return const FeelingHistory();
              }));
            },
          ),
        ));
  }
}
