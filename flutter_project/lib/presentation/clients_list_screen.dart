import 'package:flutter/material.dart';

import '../core/widgets/client_card.dart';
import '../core/client_class.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({Key? key}) : super(key: key);

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text(
              'Add Client',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/add_client_screen');
            },

          ),
          ElevatedButton(
            child: const Text(
              'Refresh',
            ),
            onPressed: () {
              setState(() {

              });
            },

          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ListView.builder(
                itemCount: clients.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: ClientCard(client: clients[index]),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/client_detailes_screen',
                        arguments: clients[index],
                      );
                    },
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
