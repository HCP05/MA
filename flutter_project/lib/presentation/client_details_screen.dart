import 'package:flutter_project/core/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/client_class.dart';

class ClientDetailesScreen extends StatefulWidget {
  const ClientDetailesScreen({required this.client, Key? key})
      : super(key: key);

  final Client client;

  @override
  State<ClientDetailesScreen> createState() => _ClientDetailesScreenState();
}

class _ClientDetailesScreenState extends State<ClientDetailesScreen> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final adressController = TextEditingController();

    emailController.text = widget.client.email;
    phoneController.text = widget.client.phoneNumber;
    adressController.text = widget.client.adress;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.client.name,
          style: const TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Delete Client',
              ),
              onPressed: () {
                setState(() {
                  clients.removeWhere((element) => element == widget.client);
                });
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ShowMessage(
                        title: 'Deleted Client',
                        message:
                        'The client you selected was succesfully deleted.',
                      );
                    });
              },
            ),
            ElevatedButton(
              child: const Text(
                'Update Client',
              ),
              onPressed: () {
                widget.client.copyWith(
                    email: emailController.text,
                    phoneNumber: phoneController.text,
                    adress: adressController.text);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ShowMessage(
                        title: 'Updated Client',
                        message: 'The client was succesfully updated.',
                      );
                    });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardAppearance: Theme.of(context).brightness,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'Email Adress',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: phoneController,
              keyboardAppearance: Theme.of(context).brightness,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: adressController,
              keyboardAppearance: Theme.of(context).brightness,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'Adress',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
