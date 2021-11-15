import 'package:flutter/material.dart';

import 'contact.dart';

class IndividualContact extends StatelessWidget {
  Contact contact;

  IndividualContact({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Individual Contact'),
        actions: [
          TextButton(
            child: Text(
              'Edit',
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      // Icon(
                      //   Icons.arrow_back,
                      //   size: 60.0,
                      // ),
                      // Card(
                      //     color: Colors.yellow,
                      //     child: Text('Edit',
                      //         style: TextStyle(
                      //           fontFamily: 'Source Sans Pro',
                      //           fontSize: 15.0,
                      //           fontWeight: FontWeight.bold,
                      //         )))
                    ])),
            Container(
                child: Column(children: <Widget>[
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              Text(
                contact.getName(),
                style: TextStyle(
                  fontFamily: 'ZenAntique',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Occupation',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  color: Colors.teal.shade100,
                ),
              ),
              SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(color: Colors.teal.shade100)),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    leading: const Icon(Icons.phone, color: Colors.teal),
                    title: Text(
                      contact.getPhone(),
                      style: TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0),
                    )),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.teal),
                  title: Text(
                    contact.getEmail(),
                    style: TextStyle(
                        color: Colors.teal,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    leading: const Icon(Icons.house, color: Colors.teal),
                    title: Text(
                      '1 Washington Sq. San Jose, CA',
                      style: TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0),
                    )),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.web, color: Colors.teal),
                  title: Text(
                    'my-website.com',
                    style: TextStyle(
                        color: Colors.teal,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0),
                  ),
                ),
              ),
            ])),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                  Card(
                      color: Colors.red,
                      child: Text('Delete Contact',
                          style: TextStyle(fontSize: 15.0)))
                ])),
          ],
        ),
      ),
    );
  }
}
