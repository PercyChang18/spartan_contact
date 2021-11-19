import 'package:flutter/material.dart';

import 'contact.dart';

/// Represents a page for editing an individual contact.
class EditingContact extends StatelessWidget {
  final Contact contact;

  /// Constructs an EditingContact page.
  const EditingContact({Key? key, required this.contact}) : super(key: key);

  /// Builds the display for an EditingContact.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editing Contact'),
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[])),
            Column(children: <Widget>[
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              Text(
                contact.getName(),
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
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Card(
                      color: Colors.red,
                      child: Text('Delete Contact',
                          style: TextStyle(fontSize: 15.0)))
                ]),
          ],
        ),
      ),
    );
  }
}
