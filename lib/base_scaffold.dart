import 'package:flutter/material.dart';
import './base_appbar.dart';

// This widget is a convenience base scaffold of our application.
// It is stateless,
// It is recommend for every page to leverage the base scaffold for
// consistency in look and feel

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {Key? key,
      required this.title,
      required this.node,
      required this.pparam,
      required this.data,
      required this.appbarbackground,
      required this.logoUri,
      required this.appbarWidgets,
      required this.appbarbottom,
      required this.btappbarbackground,
      required this.body,
      required this.bottomNav,
      required this.faburl,
      required this.fabtooltip,
      required this.fabIcon})
      : super(key: key);

  final String title;
  final String node;
  final String pparam;
  final Object? data;
  final Color appbarbackground;
  final String logoUri;
  final PreferredSizeWidget? appbarbottom;
  final List<Widget> appbarWidgets;
  final Color btappbarbackground;
  final Widget bottomNav;
  final Widget body;
  final String faburl;
  final String fabtooltip;
  final Icon fabIcon;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BaseAppBar(
        key: key,
        backgroundColor: appbarbackground,
        title: Text(title,
            style: TextStyle(
                fontSize: (width <= 600) ? 15 : 20,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal)),
        appbarheight: height * 0.1,
        logoUri: logoUri,
        elevation: 10,
        widgets: appbarWidgets,
        bottom: appbarbottom,
      ),
      body: body,
      bottomNavigationBar: BottomAppBar(
        color: btappbarbackground,
        shape: const CircularNotchedRectangle(),
        child: bottomNav,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BaseAppBar.launchURL(faburl);
        },
        tooltip: fabtooltip,
        child: fabIcon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
