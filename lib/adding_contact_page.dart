import 'package:flutter/material.dart';

import 'contact.dart';
import 'model.dart';

/// Represents a page for adding an individual contact.
/// @author Viola Yasuda
/// @version 11/18/2021
class AddingContact extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final occupationController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();
  final notesController = TextEditingController();
  final Model model;

  /// Constructs an AddingContact page.
  AddingContact({Key? key, required this.model}) : super(key: key);

  /// Builds the display for an AddingContact.
  @override
  Widget build(BuildContext context) {
    nameController.text = "";
    occupationController.text = "";
    phoneController.text = "";
    emailController.text = "";
    addressController.text = "";
    websiteController.text = "";
    notesController.text = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding Contact'),
      ),
      backgroundColor: Colors.teal,
      body: Form(
        key: _formKey,
        child: ListView(
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
              TextFormField(
                controller: nameController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'ZenAntique',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Contact Name Here',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: occupationController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  color: Colors.teal.shade100,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter contact\'s occupation',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
                  title: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: 'Enter contact\'s phone number',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.teal),
                  title: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter contact\'s email address',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.house, color: Colors.teal),
                  title: TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      hintText: 'Enter contact\'s home address',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        addressController.text = "";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.web, color: Colors.teal),
                  title: TextFormField(
                    controller: websiteController,
                    decoration: const InputDecoration(
                      hintText: 'Enter contact\'s website',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        websiteController.text = "";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.notes, color: Colors.teal),
                  title: TextFormField(
                    controller: notesController,
                    decoration: const InputDecoration(
                      hintText: 'Enter contact\'s notes',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        notesController.text = "";
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      List<String> name = nameController.text.split(" ");
                      model.addContact(Contact(
                          nameController.text,
                          name[0],
                          name[name.length - 1],
                          occupationController.text,
                          phoneController.text,
                          emailController.text,
                          addressController.text,
                          websiteController.text,
                          notesController.text,
                          model.genID()));
                      nameController.text = "";
                      occupationController.text = "";
                      phoneController.text = "";
                      emailController.text = "";
                      addressController.text = "";
                      websiteController.text = "";
                      notesController.text = "";
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
