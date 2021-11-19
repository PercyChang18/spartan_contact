import 'package:flutter/material.dart';

import 'contact.dart';
import 'contacts_database.dart';
import 'contacts_page.dart';
import 'model.dart';
import 'organization_setting.dart';

///
void main() async {
  List<Contact> list = await getContacts();
  Model model = Model(list, "last name");
  ContactsPage contactsPage = ContactsPage(model: model);
  OrganizationSetting organizationSetting = OrganizationSetting(model: model);
  model.registerView(organizationSetting);
  runApp(SpartanContact(
      model: model,
      contactsPage: contactsPage,
      organizationSetting: organizationSetting));
}

/// Represents the entire Spartan Contacts app.
class SpartanContact extends StatelessWidget {
  final Model model;
  final ContactsPage contactsPage;
  final OrganizationSetting organizationSetting;

  /// Constructs the SpartanContact object.
  const SpartanContact(
      {Key? key,
      required this.model,
      required this.contactsPage,
      required this.organizationSetting})
      : super(key: key);

  /// Builds the display of the SpartanContact object.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => contactsPage,
        '/organization_setting': (context) => organizationSetting,
        //'/individual_contact': (context) => IndividualContact(),
      },
    );
  }
}
