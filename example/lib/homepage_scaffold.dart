import 'package:flutter/material.dart';
import 'package:sportsapp/carrom_scaffold.dart';

class ContentHomepage extends StatelessWidget {
  const ContentHomepage(
      {Key? key,
      required this.title,
      required this.node,
      required this.pparam,
      required this.data})
      : super(key: key);

  final String title;
  final String node;
  final String pparam;
  final Object? data;

  @override
  Widget build(BuildContext context) {
    return CarromScaffold(
        title: title,
        node: node,
        pparam: pparam,
        data: data,
        appbarbottom: null,
        body: const Center(child: Text('Welcome Static Library')));
  }
}
