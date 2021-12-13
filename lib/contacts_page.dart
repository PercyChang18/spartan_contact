import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adding_contact_page.dart';
import 'contact.dart';
import 'individual_contact.dart';
import 'model.dart';
import 'view.dart';

/// Represents the contacts page of the Spartan Contacts App.
/// @authors Kuang-Chi Chang, Joel Jacob, Viola Yasuda
/// @version 12/12/2021
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
  late List<GestureDetector> detectorList;
  final searchController = TextEditingController();
  String dropdownValue = 'All:';
  var currentFocus;

  _ContactsPageState(this.model);

  /// Initializes the list of GestureDetector objects for use in the build method.
  void initializeDetectorList(BuildContext context) {
    detectorList = <GestureDetector>[];
    for (int i = 0; i < model.getDisplayedContactsList().length; i++) {
      detectorList.add(
        GestureDetector(
          child: ContactContainer(contact: model.getDisplayedContactsList()[i]),
          onTap: () {
            //Navigator.pushNamed(context, '/individual_contact');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IndividualContact(
                        contact: model.getDisplayedContactsList()[i],
                        model: model)));
          },
        ),
      );
    }
  }

  /// Allows the keypad to be closed.
  void unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
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
        child: ListView(
          children: <Widget>[
            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              color: Colors.white,
              child: ListTile(
                //leading: const Icon(Icons.search, color: Colors.teal),
                title: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: DropdownButton<String>(
                        value: dropdownValue,
                        elevation: 16,
                        style: const TextStyle(color: Colors.teal),
                        underline: Container(
                          height: 2,
                          color: Colors.teal,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'All:',
                          'Name:',
                          'Occupation:',
                          'Phone:',
                          'Email:'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      suffixIcon: IconButton(
                        color: Colors.teal,
                        onPressed: () {
                          searchController.text = "";
                          model.resetList();
                          unfocus();
                        },
                        icon: Icon(Icons.clear),
                      ),
                      hintText: "Enter search query here.",
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: Colors.grey[60])),
                  controller: searchController,
                  onEditingComplete: () {
                    if (dropdownValue == 'All:') {
                      model.searchByAll(searchController.text);
                    } else if (dropdownValue == 'Name:') {
                      model.searchByName(searchController.text);
                    } else if (dropdownValue == 'Occupation:') {
                      model.searchByOccupation(searchController.text);
                    } else if (dropdownValue == 'Phone:') {
                      model.searchByPhone(searchController.text);
                    } else if (dropdownValue == 'Email:') {
                      model.searchByEmail(searchController.text);
                    }
                    unfocus();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
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

  /// Updates the state of the page.
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
          Text(contact.getFullName()),
        ],
      ),
    );
  }
}
