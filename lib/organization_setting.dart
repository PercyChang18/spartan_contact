import 'package:flutter/material.dart';

import 'constants.dart';
import 'organization_button.dart';

///
class OrganizationSetting extends StatefulWidget {
  ///
  const OrganizationSetting({Key? key}) : super(key: key);

  ///
  @override
  _OrganizationSettingState createState() => _OrganizationSettingState();
}

///
class _OrganizationSettingState extends State<OrganizationSetting> {
  bool lastNameIsSelected = false;
  bool firstNameIsSelected = false;
  bool customLabelIsSelected = false;
  bool occupationIsSelected = false;
  bool phoneIsSelected = false;
  bool emailIsSelected = false;

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
                    lastNameIsSelected = !lastNameIsSelected;
                  });
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
                    firstNameIsSelected = !firstNameIsSelected;
                  });
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
                    customLabelIsSelected = !customLabelIsSelected;
                  });
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
                    occupationIsSelected = !occupationIsSelected;
                  });
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
                    phoneIsSelected = !phoneIsSelected;
                  });
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
                    emailIsSelected = !emailIsSelected;
                  });
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
}
