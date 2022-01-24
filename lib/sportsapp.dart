library sportsapp;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './storage_service.dart';

class CarromApp extends StatelessWidget {
  final String title;
  final Route<dynamic>? Function(RouteSettings) routegenerator;

  const CarromApp({Key? key, required this.title, required this.routegenerator})
      : super(key: key);

  /// Adds banner to the child widget.
  Widget _wrapWithBanner(Widget child) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Banner(
          child: child,
          location: BannerLocation.topStart,
          message: 'BETA',
          color: Colors.limeAccent.withOpacity(0.6),
          textStyle: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 14.0, letterSpacing: 1.0),
          textDirection: TextDirection.rtl,
        ));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StorageService(),
      child: ScreenUtilInit(
          designSize: const Size(1200, 900),
          minTextAdapt: true,
          builder: () => MaterialApp(
                title: title,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  // Define the default brightness and colors.
                  //brightness: Brightness.dark,
                  primaryColor: Colors.lightBlue[800],

                  // Define the default font family.
                  fontFamily: 'Open Sans',

                  // // Define the default `TextTheme`. Use this to specify the default
                  // // text styling for headlines, titles, bodies of text, and more.
                  textTheme: TextTheme(
                    headline1:
                        TextStyle(fontSize: 72.sp, fontWeight: FontWeight.bold),
                    headline6:
                        TextStyle(fontSize: 36.sp, fontStyle: FontStyle.italic),
                    bodyText1: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Hind',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    bodyText2: TextStyle(fontSize: 12.sp, fontFamily: 'Hind'),
                  ),
                  // add tabBarTheme
                  tabBarTheme: TabBarTheme(
                      //labelColor: Colors.white,
                      labelStyle: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'Hind',
                          color: Colors.white), // color for text
                      indicator: UnderlineTabIndicator(
                          // color for indicator (underline)
                          borderSide:
                              BorderSide(width: 2.w, color: Colors.white))),
                  listTileTheme: const ListTileThemeData(
                    dense: true,
                  ),
                  splashColor: Colors.lightBlue[100],
                  highlightColor: Colors.amber.withOpacity(.3),
                  primarySwatch: Colors.blue,
                ),
                initialRoute: '/',
                onGenerateInitialRoutes: (initialRoute) => [
                  routegenerator(RouteSettings(name: initialRoute))!,
                ],
                onGenerateRoute: routegenerator, //RouteGenerator.generateRoute,
              )),
    );
  }
}
