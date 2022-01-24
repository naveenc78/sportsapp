import 'package:flutter/material.dart';
import './base_scaffold.dart';
import './base_appbar.dart';

const memberurl = 'https://www.uscarrom.org/membership-details/';
const donateurl =
    'https://www.paypal.com/donate/?hosted_button_id=9SQ5CST8FTGE6';
const tourneyurl = 'https://www.uscarrom.org/tournament/';
const uscarromurl = 'https://www.uscarrom.org';

// This widget is a convenience base scaffold of our application.
// It is stateless,
// It is recommend for every page to leverage the base scaffold for
// consistency in look and feel

class CarromScaffold extends StatelessWidget {
  const CarromScaffold(
      {Key? key,
      required this.title,
      required this.node,
      required this.pparam,
      required this.data,
      required this.appbarbottom,
      required this.body})
      : super(key: key);

  final String title;
  final String node;
  final String pparam;
  final Object? data;
  final PreferredSizeWidget? appbarbottom;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: title,
        node: node,
        pparam: pparam,
        data: data,
        appbarbackground: Colors.blue[800]!,
        logoUri: uscarromurl,
        appbarWidgets: buildactions(context),
        appbarbottom: appbarbottom,
        btappbarbackground: Colors.blue[100]!,
        body: body,
        bottomNav: buildBottomBar(context),
        faburl: tourneyurl,
        fabtooltip: 'Play With / Follow Us',
        fabIcon: const Icon(Icons.play_circle_fill));
  }

  // method to build the bottom nav bar
  Widget buildBottomBar(context) {
    return Container(
      height: 50, //0.065.sh,
      child: Row(
        children: <Widget>[
          const Spacer(),
          Tooltip(
              message: 'Become a USCA Member',
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.wallet_membership_outlined),
                  style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {
                    BaseAppBar.launchURL(memberurl);
                  },
                  label:
                      const Text('Join Us', style: TextStyle(fontSize: 14.0)))),
          const Spacer(),
          (MediaQuery.of(context).size.width >= 600)
              ? const Text('\n\n@Copyright USCA 2022.',
                  style: TextStyle(fontSize: 9.0))
              : const Text(''),
          const Spacer(),
          Tooltip(
              message: 'Give to the sport you love in just a click. Thank you!',
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.attach_money_outlined),
                  style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    BaseAppBar.launchURL(donateurl);
                  },
                  label: const Text('Donate', style: TextStyle(fontSize: 14)))),
          const Spacer(),
        ],
      ),
    );
  }

  //build actions widgets on the title bar
  List<Widget> buildactions(BuildContext context) {
    return <Widget>[
      Transform.scale(
        scale: 1.25,
        child: IconButton(
          icon: const Icon(Icons.account_box_rounded),
          onPressed: () {},
          tooltip: 'Sign In - Coming Soon',
        ),
      ),
      (MediaQuery.of(context).size.width <= 600)
          ? const SizedBox(width: 5)
          : const SizedBox(width: 15),
    ];
  }
}
