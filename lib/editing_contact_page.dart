import 'package:flutter/material.dart';

import 'contact.dart';
import 'contacts_database.dart';
import 'model.dart';

/// Represents a page for editing an individual contact.
/// @author Viola Yasuda
/// @version 11/18/2021
class EditingContact extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final occupationController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();

  final Model model;
  final Contact contact;

  /// Constructs an EditingContact page.
  EditingContact({Key? key, required this.contact, required this.model})
      : super(key: key);

  /// Builds the display for an EditingContact.
  @override
  Widget build(BuildContext context) {
    nameController.text = contact.getFullName();
    occupationController.text = contact.getOccupation();
    phoneController.text = contact.getPhone();
    emailController.text = contact.getEmail();
    addressController.text = contact.getAddress();
    websiteController.text = contact.getWebsite();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editing Contact'),
      ),
      backgroundColor: Colors.teal,
      body: Form(
        key: _formKey,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        //return 'Please enter some text';
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
                        //return 'Please enter some text';
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
                      contact.setName(nameController.text);
                      contact.setOccupation(occupationController.text);
                      contact.setPhone(phoneController.text);
                      contact.setEmail(emailController.text);
                      contact.setAddress(addressController.text);
                      contact.setWebsite(websiteController.text);
                      updateContact(contact);
                      model.notifyView();
                    }
                  },
                  child: const Text('Update Contact'),
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
                      contact.setName(nameController.text);
                      contact.setOccupation(occupationController.text);
                      contact.setPhone(phoneController.text);
                      contact.setEmail(emailController.text);
                      contact.setAddress(addressController.text);
                      contact.setWebsite(websiteController.text);
                      model.notifyView();
                    }
                  },
                  child: const Text('Update Contact'),
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    model.removeContact(contact);
                  },
                  child: const Text('Delete Contact'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red)),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
