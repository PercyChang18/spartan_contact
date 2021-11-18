import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sorting.dart';

import 'contact.dart';
import 'individual_contact.dart';

/// Represents the contacts page of the Spartan Contacts App.
class ContactsPage extends StatefulWidget {
  /// Constructs the ContactsPage.
  const ContactsPage({Key? key}) : super(key: key);

  /// Creates the state for the ContactsPage.
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

/// Represents the state of the contacts page of the Spartan Contacts App.
class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contactsList = <Contact>[
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
  ];
  List<GestureDetector> detectorList = <GestureDetector>[];

  Sorting s = new Sorting();

  /// Initializes the list of GestureDetector objects for use in the build method.
  void initializeDetectorList(BuildContext context) {
    detectorList = <GestureDetector>[];
    s.sortByEmail(contactsList); //Hard coded sorting method.
    for (int i = 0; i < contactsList.length; i++) {
      detectorList.add(
        GestureDetector(
          child: ContactContainer(contact: contactsList[i]),
          onTap: () {
            //Navigator.pushNamed(context, '/individual_contact');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        IndividualContact(contact: contactsList[i])));
          },
        ),
      );
    }
  }

  /// Builds the display of the contacts page.
  @override
  Widget build(BuildContext context) {
    initializeDetectorList(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_tree_rounded),
        title: const Text('Spartan Contacts'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            tooltip: 'Organization Settings',
            onPressed: () {
              Navigator.pushNamed(context, '/organization_setting');
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
            Column(children: detectorList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Represents a visual container for a contact.
class ContactContainer extends StatelessWidget {
  final Contact contact;

  /// Constructs a ContactContainer.
  const ContactContainer({Key? key, required this.contact}) : super(key: key);

  /// Builds the display of the ContactContainer.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Text(contact.getName()),
        ],
      ),
    );
  }
}
