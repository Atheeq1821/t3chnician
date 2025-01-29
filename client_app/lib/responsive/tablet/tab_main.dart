
import 'package:flutter/material.dart';

class TabMain extends StatefulWidget {
  Widget widget1;
  Widget widget2;
  Widget widget3;
  TabMain({super.key, required this.widget1, required this.widget2, required this.widget3});

  @override
  State<TabMain> createState() => _TabMainState();
}

class _TabMainState extends State<TabMain> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          flex: size.width > 1340 ? 3 : 5,
          child: widget.widget1,
        ),
        Expanded(
          flex: size.width > 1340 ? 6 : 8,
          child: widget.widget2
          ),
          if(widget.widget3.runtimeType != Placeholder)
            Expanded(
              flex: size.width > 1340 ? 3 : 6,
              child: widget.widget3,
              )
      ],
      );
  }
}