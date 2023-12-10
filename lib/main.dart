import 'package:flutter/material.dart';
import 'package:src/models/app_routes.dart';
import 'package:src/models/color_scheme.dart';
import 'package:get/get.dart';

void main() => runApp(const Unjatoday());

class Unjatoday extends StatelessWidget {
  const Unjatoday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Berita',
      theme: AppTheme.getTheme(),
      initialRoute: '/landing', // initial route
      getPages: appPages,
    );
  }
}
