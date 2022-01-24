import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final double elevation;
  final Text title;
  final double appbarheight;
  final List<Widget> widgets;
  final String logoUri;
  final PreferredSizeWidget? bottom;

  /// you can add more fields that meet your needs
  const BaseAppBar(
      {required Key? key,
      required this.backgroundColor,
      required this.elevation,
      required this.title,
      required this.appbarheight,
      required this.widgets,
      required this.bottom,
      required this.logoUri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AppBar(
      elevation: 10,
      backgroundColor: backgroundColor, // color of app bar
      toolbarHeight: appbarheight,
      leadingWidth: width * 0.15,
      // lead with the logo, if you need a menu bar, this can be moved to title
      leading: Padding(
        padding: const EdgeInsets.all(0.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Image.asset(
              "assets/images/logo.png",
            ),
            onTap: () => launchURL(logoUri),
          ),
        ),
      ),
      // let's define the title now
      title: title,
      centerTitle: true,
      actions: widgets,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarheight);

  // Launch URL
  static void launchURL(String url) async {
    await launch(url);
  }
}
