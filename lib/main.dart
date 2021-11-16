import 'package:flutter/material.dart';

import 'contacts_page.dart';
import 'organization_setting.dart';

void main() {
  runApp(const SpartanContact());
}

class SpartanContact extends StatelessWidget {
  const SpartanContact({Key? key}) : super(key: key);

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
