import 'package:flutter/material.dart';

import 'contact.dart';
import 'contacts_page.dart';
import 'model.dart';
import 'organization_setting.dart';

///
void main() {
  Model model = Model(<Contact>[
    Contact(
        "name1", "occupation1", "phone1", "email1", "address1", "website1", 1),
    Contact(
        "name2", "occupation2", "phone2", "email2", "address2", "website2", 2),
    Contact(
        "name3", "occupation3", "phone3", "email3", "address3", "website3", 3),
    Contact(
        "Viola Yasuda",
        "Software Engineering Student",
        "510-111-2222",
        "viola.yasuda@sjsu.edu",
        "1234 Washington Sq. San Jose, CA 12345",
        "vyasuda.website.com",
        4),
  ], "last name");
  ContactsPage contactsPage = ContactsPage(model: model);
  OrganizationSetting organizationSetting = OrganizationSetting(model: model);
  model.registerView(contactsPage);
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
