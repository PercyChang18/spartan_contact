import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'individual_contact.dart';

List<Contact> contactsList = <Contact>[
  Contact("name1", "phone1", "email1", 1),
  Contact("name2", "phone2", "email2", 2),
  Contact("name3", "phone3", "email3", 3),
  Contact("name4", "phone4", "email4", 4),
  Contact("name5", "phone5", "email5", 5),
  Contact("Joe Shmoe", "123-456-7890", "joe.shmoe@email.com", 6)
];
List<GestureDetector> detectorList = <GestureDetector>[];
void initializeDetectorList(BuildContext context) {
  detectorList = <GestureDetector>[];
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

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    initializeDetectorList(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_tree_rounded),
        title: Text('Spartan Contacts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
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
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                children: <Widget>[
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
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactContainer extends StatelessWidget {
  Contact contact;
  ContactContainer({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Text(contact.getName()),
        ],
      ),
    );
  }
}
