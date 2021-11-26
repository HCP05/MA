import 'package:flutter_project/core/theme.dart';
import 'package:flutter_project/presentation/clients_list_screen.dart';
import 'package:flutter/material.dart';

import './core/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Clients',
      theme: buildAppTheme(),
      home: const ClientsListScreen(),
      onGenerateRoute: routeGenerator,
    );
  }
}
