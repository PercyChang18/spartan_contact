import 'package:flutter/material.dart';
import 'organization_setting.dart';
import 'contacts_page.dart';
import 'individual_contact.dart';

void main() {
  runApp(SpartanContact());
}


class SpartanContact extends StatelessWidget {
  const SpartanContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => ContactsPage(),
        '/organization_setting': (context) => OrganizationSetting(),
        '/individual_contact': (context) => IndividualContact(),


      },
    );
  }
}



