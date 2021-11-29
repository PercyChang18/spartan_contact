import 'package:flutter/material.dart';

import 'constants.dart';
import 'contact.dart';
import 'model.dart';
import 'organization_button.dart';
import 'view.dart';

///
class OrganizationSetting extends StatefulWidget implements View {
  final Model model;

  ///
  const OrganizationSetting({Key? key, required this.model}) : super(key: key);

  ///
  @override
  _OrganizationSettingState createState() {
    _OrganizationSettingState state = _OrganizationSettingState(model);
    return state;
  }

  @override
  void update() {
    // TODO: implement update
  }
}

///
class _OrganizationSettingState extends State<OrganizationSetting>
    implements View {
  late Model model;
  late bool nameIsSelected;
  late bool customLabelIsSelected;
  late bool occupationIsSelected = false;
  late bool phoneIsSelected = false;
  late bool emailIsSelected = false;

  late List<Contact> contactsList;

  _OrganizationSettingState(this.model) {
    contactsList = model.getDisplayedContactsList();
    nameIsSelected = model.getOrganizationStyle() == "name";
    customLabelIsSelected = model.getOrganizationStyle() == "custom";
    occupationIsSelected = model.getOrganizationStyle() == "occupation";
    phoneIsSelected = model.getOrganizationStyle() == "phone";
    emailIsSelected = model.getOrganizationStyle() == "email";
  }

  void sortttt() {
    if (emailIsSelected == false) {
      contactsList.sort((a, b) => a.getEmail().compareTo(b.getEmail()));
    } else {
      contactsList.sort((a, b) => a.getName().compareTo(b.getName()));
    }
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort By'),
        backgroundColor: const Color(0xFF4224FE),
      ),
      backgroundColor: const Color(0xFF4224FE),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    nameIsSelected = true;
                    customLabelIsSelected = false;
                    occupationIsSelected = false;
                    phoneIsSelected = false;
                    emailIsSelected = false;
                  });
                  model.setOrganizationStyle("name");
                },
                child: OrganizationButton(
                  'Name',
                  nameIsSelected
                      ? kButtonSelectedColor
                      : kButtonNotSelectedColor,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    nameIsSelected = false;
                    customLabelIsSelected = true;
                    occupationIsSelected = false;
                    phoneIsSelected = false;
                    emailIsSelected = false;
                  });
                  model.setOrganizationStyle("custom");
                },
                child: OrganizationButton(
                  'Custom Label',
                  customLabelIsSelected
                      ? kButtonSelectedColor
                      : kButtonNotSelectedColor,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    nameIsSelected = false;
                    customLabelIsSelected = false;
                    occupationIsSelected = true;
                    phoneIsSelected = false;
                    emailIsSelected = false;
                  });
                  model.setOrganizationStyle("occupation");
                },
                child: OrganizationButton(
                  'Occupation',
                  occupationIsSelected
                      ? kButtonSelectedColor
                      : kButtonNotSelectedColor,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    nameIsSelected = false;
                    customLabelIsSelected = false;
                    occupationIsSelected = false;
                    phoneIsSelected = true;
                    emailIsSelected = false;
                  });
                  model.setOrganizationStyle("phone");
                },
                child: OrganizationButton(
                  'Phone',
                  phoneIsSelected
                      ? kButtonSelectedColor
                      : kButtonNotSelectedColor,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    nameIsSelected = false;
                    customLabelIsSelected = false;
                    occupationIsSelected = false;
                    phoneIsSelected = false;
                    emailIsSelected = true;
                  });
                  model.setOrganizationStyle("email");
                },
                child: OrganizationButton(
                  'Email',
                  emailIsSelected
                      ? kButtonSelectedColor
                      : kButtonNotSelectedColor,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            const Expanded(
              flex: 2,
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void update() {
    setState(() {});
  }
}
