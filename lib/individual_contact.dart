import 'package:flutter/material.dart';

import 'contact.dart';
import 'editing_contact_page.dart';
import 'model.dart';

/// Represents a page for an individual contact.
/// @author Viola Yasuda
/// @version 12/12/2021
class IndividualContact extends StatelessWidget {
  final Contact contact;
  final Model model;

  /// Constructs an IndividualContact page.
  const IndividualContact(
      {Key? key, required this.contact, required this.model})
      : super(key: key);

  /// Builds the display for an IndividualContact.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual Contact'),
        actions: [
          TextButton(
            child: const Text(
              'Edit',
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditingContact(contact: contact, model: model)));
            },
          ),
        ],
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              Text(
                contact.getFullName(),
                style: const TextStyle(
                  fontFamily: 'ZenAntique',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                contact.getOccupation(),
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  color: Colors.teal.shade100,
                ),
              ),
              SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(color: Colors.teal.shade100)),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    leading: const Icon(Icons.phone, color: Colors.teal),
                    title: Text(
                      contact.getPhone(),
                      style: const TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0),
                    )),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.teal),
                  title: Text(
                    contact.getEmail(),
                    style: const TextStyle(
                        color: Colors.teal,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    leading: const Icon(Icons.house, color: Colors.teal),
                    title: Text(
                      contact.getAddress(),
                      style: const TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0),
                    )),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.web, color: Colors.teal),
                  title: Text(
                    contact.getWebsite(),
                    style: const TextStyle(
                        color: Colors.teal,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.notes, color: Colors.teal),
                  title: Text(
                    contact.getNotes(),
                    style: const TextStyle(
                        color: Colors.teal,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
