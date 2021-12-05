import 'dart:async';

import 'package:flutter_project/core/database_helper.dart';
import 'package:flutter/material.dart';

import '../core/widgets/client_card.dart';
import '../core/client_model.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({Key? key}) : super(key: key);

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  late String _now;
  late Timer _everySecond;

  @override
  void initState() {
    super.initState();

    // sets first value
    _now = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: const Text(
          'Add Client',
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/add_client_screen');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: FutureBuilder<List<Client>>(
                future: DatabaseHelper.instance.getClients(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        'Loading',
                        style: TextStyle(
                          fontSize:
                          Theme.of(context).textTheme.headline4!.fontSize,
                        ),
                      ),
                    );
                  }
                  return snapshot.data!.isEmpty
                      ? Center(
                    child: Text(
                      'There are no clients in the list yet.',
                      style: TextStyle(
                        fontSize: Theme.of(context)
                            .textTheme
                            .headline5!
                            .fontSize,
                      ),
                    ),
                  )
                      : ListView(
                    children: snapshot.data!.map((client) {
                      return InkWell(
                          child: ClientCard(client: client),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/client_detailes_screen',
                              arguments: client,
                            );
                          });
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
