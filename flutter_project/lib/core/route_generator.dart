import 'package:flutter/material.dart';

import '../presentation/clients_list_screen.dart';
import '../presentation/add_client_screen.dart';
import '../presentation/client_details_screen.dart';

Route<dynamic> routeGenerator(RouteSettings route) {
  final dynamic args = route.arguments;

  switch (route.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => const ClientsListScreen(),
      );
    case '/add_client_screen':
      return MaterialPageRoute(builder: (_) => const AddClientScreen());
    case '/client_detailes_screen':
      return MaterialPageRoute(
        builder: (_) => ClientDetailesScreen(client: args),
      );
  }
  throw UnimplementedError();
}
