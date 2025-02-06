
import 'package:client_app/assets.dart';
import 'package:client_app/home.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, 
      child: Scaffold(
        body: ValueListenableBuilder<Map<String, Widget?>>(
          valueListenable: columnContentNotifier,
          builder: (context, value, child) {
            return ResponsiveLayout(
              phone: Homeview(),
              pad: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child:value["column1"] ?? SizedBox.shrink(),
                  ),
                  Expanded(
                    flex: 9,
                    child:value["column2"] ?? SizedBox.shrink(),
                  ),
                                  if (value["column3"] != null)
                    Expanded(
                      flex: 2,
                      child: value["column3"]!,
                    ),
                ],
              ),
              laptop: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: value["column1"] ?? SizedBox.shrink(),
                  ),
                  Expanded(
                    flex: 8,
                    child:value["column2"] ?? SizedBox.shrink(),
                  ),
                  if (value["column3"] != null)
                    Expanded(
                      flex: 2,
                      child: value["column3"]!,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}