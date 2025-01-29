
import 'package:client_app/assets.dart';
import 'package:client_app/responsive/tablet/hover.dart';
import 'package:flutter/material.dart';

class TopNav extends StatefulWidget {
  final String name;
  final bool active;
  const TopNav({super.key, required this.name, required this.active});

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
            builder: (isHovered){
              return Container(
                padding:EdgeInsets.only(
                        bottom: 3, // Space between underline and text
                        ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: isHovered || widget.active?AppColors.secondary: Colors.transparent,
                    width: 1
                  ))
                ),
                child: Text(widget.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  color: isHovered || widget.active? AppColors.secondary:AppColors.textColor,
                )
                ),
              );
            },
          );
  }
}