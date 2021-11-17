import 'package:flutter/material.dart';

import 'contacts_page.dart';
import 'organization_setting.dart';

///
void main() {
  runApp(const SpartanContact());
}

/// Represents the entire Spartan Contacts app.
class SpartanContact extends StatelessWidget {
  /// Constructs the SpartanContact object.
  const SpartanContact({Key? key}) : super(key: key);

  /// Builds the display of the SpartanContact object.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactsPage(),
        '/organization_setting': (context) => const OrganizationSetting(),
        //'/individual_contact': (context) => IndividualContact(),
      },
    );
  }
}
