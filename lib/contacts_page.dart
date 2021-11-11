import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'organization_setting.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
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
            GestureDetector(
              child: ContactContainer(),
              onTap: () {
                Navigator.pushNamed(context, '/individual_contact');
              },
            ),
            GestureDetector(
              child: ContactContainer(),
              onTap: () {
                Navigator.pushNamed(context, '/individual_contact');
              },
            ),
            GestureDetector(
              child: ContactContainer(),
              onTap: () {
                Navigator.pushNamed(context, '/individual_contact');
              },
            ),
            GestureDetector(
              child: ContactContainer(),
              onTap: () {
                Navigator.pushNamed(context, '/individual_contact');
              },
            ),
            GestureDetector(
              child: ContactContainer(),
              onTap: () {
                Navigator.pushNamed(context, '/individual_contact');
              },
            ),
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
  const ContactContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Text('Name'),
        ],
      ),
    );
  }
}
