import 'package:flutter/material.dart';

import 'constants.dart';
import 'contact.dart';
import 'model.dart';
import 'organization_button.dart';
import 'view.dart';

///Represents the page for setting organization
///@author Kuang-Chi Chang
///@version 12/05/2021
class OrganizationSetting extends StatefulWidget {
  final Model model;

  ///Constructs the page.
  const OrganizationSetting({Key? key, required this.model}) : super(key: key);

  ///Creates state.
  @override
  _OrganizationSettingState createState() {
    _OrganizationSettingState state = _OrganizationSettingState(model);
    return state;
  }
}

///Constructs the state of the organization setting page
class _OrganizationSettingState extends State<OrganizationSetting>
    implements View {
  late Model model;
  late bool firstNameIsSelected;
  late bool lastNameIsSelected;
  late bool occupationIsSelected;
  late bool phoneIsSelected;
  late bool emailIsSelected;
  late bool homeAddressIsSelected;
  late bool websiteIsSelected;

  late List<Contact> contactsList;

  /// Constructs the _OrganizationSettingState.
  _OrganizationSettingState(this.model) {
    contactsList = model.getDisplayedContactsList();
    firstNameIsSelected = model.getOrganizationStyle() == "first name";
    lastNameIsSelected = model.getOrganizationStyle() == "last name";
    occupationIsSelected = model.getOrganizationStyle() == "occupation";
    phoneIsSelected = model.getOrganizationStyle() == "phone";
    emailIsSelected = model.getOrganizationStyle() == "email";
    homeAddressIsSelected = model.getOrganizationStyle() == "home address";
    websiteIsSelected = model.getOrganizationStyle() == "website";
  }

  ///Builds the organization setting page
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
                    firstNameIsSelected = true;
                    lastNameIsSelected = false;
                    occupationIsSelected = false;
                    phoneIsSelected = false;
                    emailIsSelected = false;
                    homeAddressIsSelected = false;
                    websiteIsSelected = false;
                  });
                  model.setOrganizationStyle("first name");
                },
                child: OrganizationButton(
                  'First Name',
                  firstNameIsSelected
                      ? kButtonSelectedColor
                      : kButtonNotSelectedColor,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    firstNameIsSelected = false;
                    lastNameIsSelected = true;
                    occupationIsSelected = false;
                    phoneIsSelected = false;
                    emailIsSelected = false;
                    homeAddressIsSelected = false;
                    websiteIsSelected = false;
                  });
                  model.setOrganizationStyle("last name");
                },
                child: OrganizationButton(
                  'Last Name',
                  lastNameIsSelected
                      ? kButtonSelectedColor
                      : kButtonNotSelectedColor,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    firstNameIsSelected = false;
                    lastNameIsSelected = false;
                    occupationIsSelected = true;
                    phoneIsSelected = false;
                    emailIsSelected = false;
                    homeAddressIsSelected = false;
                    websiteIsSelected = false;
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
                    firstNameIsSelected = false;
                    lastNameIsSelected = false;
                    occupationIsSelected = false;
                    phoneIsSelected = true;
                    emailIsSelected = false;
                    homeAddressIsSelected = false;
                    websiteIsSelected = false;
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
                    firstNameIsSelected = false;
                    lastNameIsSelected = false;
                    occupationIsSelected = false;
                    phoneIsSelected = false;
                    emailIsSelected = true;
                    homeAddressIsSelected = false;
                    websiteIsSelected = false;
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
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    firstNameIsSelected = false;
                    lastNameIsSelected = false;
                    occupationIsSelected = false;
                    phoneIsSelected = false;
                    emailIsSelected = false;
                    homeAddressIsSelected = true;
                    websiteIsSelected = false;
                  });
                  model.setOrganizationStyle("home address");
                },
                child: OrganizationButton(
                  'Home Address',
                  homeAddressIsSelected
                      ? kButtonSelectedColor
                      : kButtonNotSelectedColor,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    firstNameIsSelected = false;
                    lastNameIsSelected = false;
                    occupationIsSelected = false;
                    phoneIsSelected = false;
                    emailIsSelected = false;
                    homeAddressIsSelected = false;
                    websiteIsSelected = true;
                  });
                  model.setOrganizationStyle("website");
                },
                child: OrganizationButton(
                  'Website',
                  websiteIsSelected
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

  /// Updates the state of the page.
  @override
  void update() {
    setState(() {});
  }
}
