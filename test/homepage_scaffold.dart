import 'package:flutter/material.dart';
// ignore: avoid_relative_lib_imports
import '../lib/carrom_scaffold.dart';

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
        body: const Center(child: Text('Welcome SportsApp Library')));
  }
}
