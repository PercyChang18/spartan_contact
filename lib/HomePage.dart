import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';

import 'ThemeModel.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State{
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context,ThemeModel themeNotifier,child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(themeNotifier.isDark ? "Dark Theme" : "Light Theme"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SwitcherButton(
                value: themeNotifier.isDark ? false : true,
                onChange: (value){
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
              ),
              Text('Welcome to SpartanContacts',textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ),
      );
    });
  }
}