import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget phone;
  final Widget pad;
  final Widget laptop;
  // final Size size;
   ResponsiveLayout({Key? key,required this.pad,required this.phone,required this.laptop})
      : super(key: key);

  static int phoneLimit = 600;
  static int padLimit = 1200;

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit;

  static bool isPad(BuildContext context) =>
      MediaQuery.of(context).size.width < padLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;

  static bool isLaptop(BuildContext context) =>
      MediaQuery.of(context).size.width >= padLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < phoneLimit) {
        return phone;
      }
      if (constraints.maxWidth < padLimit) {
        return pad;
      } else {
        return laptop;
      }
    });
  }
}