import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adding_contact_page.dart';
import 'contact.dart';
import 'individual_contact.dart';
import 'model.dart';
import 'sorting.dart';
import 'view.dart';

/// Represents the contacts page of the Spartan Contacts App.
class ContactsPage extends StatefulWidget {
  final Model model;

  /// Constructs the ContactsPage.
  const ContactsPage({Key? key, required this.model}) : super(key: key);

  /// Creates the state for the ContactsPage.
  @override
  _ContactsPageState createState() {
    _ContactsPageState state = _ContactsPageState(model);
    model.registerView(state);
    return state;
  }
}

/// Represents the state of the contacts page of the Spartan Contacts App.
class _ContactsPageState extends State<ContactsPage> implements View {
  late Model model;
  late List<Contact> contactsList;
  late List<GestureDetector> detectorList;

  _ContactsPageState(this.model) {
    contactsList = model.getDisplayedContactsList();
  }

  Sorting s = Sorting();

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
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddingContact(model: model);
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void update() {
    setState(() {});
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
