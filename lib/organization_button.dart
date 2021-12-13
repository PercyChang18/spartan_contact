import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///@author Kuang-Chi Chang
///@version 11/18/2021

///Represents indinidual organization setting button
class OrganizationButton extends StatelessWidget {
  final String buttonTitle;
  final Color colour;

  ///Constructs the button
  const OrganizationButton(this.buttonTitle, this.colour);

  ///Builds the button
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
          top: 20.0, left: 10.0, bottom: 15.0, right: 10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        buttonTitle,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}
