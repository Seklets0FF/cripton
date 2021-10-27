import 'package:cripton/controllers/btf.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';

void main() {
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  StartApp({Key? key}) : super(key: key);

  final BtfController btfController = Get.put<BtfController>(BtfController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CriptoN',
      navigatorKey: Get.key,
      getPages: CriptonRoutes.routes,
      initialRoute: '/',
    );
  }
}
