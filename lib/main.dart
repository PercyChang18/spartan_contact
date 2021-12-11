import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spartan_contact/HomePage.dart';
import 'package:switcher_button/switcher_button.dart';

import 'ThemeModel.dart';
import 'contacts_page.dart';
import 'model.dart';
import 'organization_setting.dart';

///
void main() {
  Model model = Model("last name");
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
  const SpartanContact({Key? key,
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

    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer(builder: (context,ThemeModel themeModel,child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Spartan Contacts',
            theme: themeModel.isDark ? ThemeData.dark() : ThemeData.light(),
            home: HomePage(),
          );
        })
    );
  }

  }




