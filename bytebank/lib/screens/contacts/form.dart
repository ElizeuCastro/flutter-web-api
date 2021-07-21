import 'package:bytebank/dao/contact_dao.dart';
import 'package:bytebank/models/Contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final ContactDAO contactDAO = new ContactDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Full name'),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: accountNumberController,
                decoration: InputDecoration(labelText: 'Account number'),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String? fullName = fullNameController.text;
                    final int? accountNumber =
                        int.tryParse(accountNumberController.text);
                    if (fullName != null && accountNumber != null) {
                      final contact = Contact(0, fullName, accountNumber);
                      contactDAO
                          .save(contact)
                          .then((id) => Navigator.pop(context));
                    }
                  },
                  child: Text('Create'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
