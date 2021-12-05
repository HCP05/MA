import 'package:flutter_project/core/client_model.dart';
import 'package:flutter_project/core/database_helper.dart';
import 'package:flutter_project/core/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final adressController = TextEditingController();
    final packageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: ElevatedButton(
        child: const Text(
          'Add Client',
        ),
        onPressed: () async {
          await DatabaseHelper.instance.add(
            Client(
              name: nameController.text,
              email: emailController.text,
              phoneNumber: phoneController.text,
              adress: adressController.text,
              package: packageController.text,
            ),
          );
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ShowMessage(
                  title: 'Client Added',
                  message:
                  'The client was succesfully created and added to the list.',
                );
              });
          setState(() {
            nameController.clear();
            emailController.clear();
            phoneController.clear();
            adressController.clear();
            packageController.clear();
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              keyboardAppearance: Theme.of(context).brightness,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
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
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: packageController,
              keyboardAppearance: Theme.of(context).brightness,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'Package',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
