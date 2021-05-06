import 'package:flutter/material.dart';
import 'package:hotel/src/widgets/icon.dart';
import 'package:hotel/src/widgets/text.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  final bool isHome;
  MyAppBar({this.isHome});
  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return (isHome == true)
        ? AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            leading: MyIcon(
              icon: Icons.arrow_back,
              size: 22,
              color: Colors.black87,
            ),
            title: MyText(
              title: "Explore",
              fontSize: 18,
              isBold: true,
            ),
            centerTitle: true,
            actions: [
              MyIcon(
                icon: Icons.favorite_border_outlined,
                size: 22,
                color: Colors.black87,
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: MyIcon(
                  icon: Icons.location_on_rounded,
                  size: 22,
                  color: Colors.black87,
                ),
              )
            ],
          )
        : AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: MyIcon(
                icon: Icons.close,
                size: 22,
                color: Colors.black87,
              ),
            ),
            title: MyText(
              title: "Filters",
              fontSize: 18,
              isBold: true,
            ),
            centerTitle: true,
          );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
