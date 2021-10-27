import 'package:cripton/screens/currency.screen.dart';
import 'package:get/get.dart';
import 'screens/home.screen.dart';

class CriptonRoutes {
  static final routes = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: '/currency', page: () => const CurrencyScreen())
  ];
}
