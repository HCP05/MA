import 'package:flutter/material.dart';

import '../client_model.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({required this.client, Key? key}) : super(key: key);

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  client.email,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  client.phoneNumber,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Text(
              client.package,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
