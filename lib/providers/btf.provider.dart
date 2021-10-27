import 'package:get/get.dart';

class BtfProvider extends GetConnect {
  Future<Response> getConnection() async =>
      await get('https://api-pub.bitfinex.com/v2/platform/status');

  Future<Response> getTickers() async =>
      await get('https://api-pub.bitfinex.com/v2/tickers?symbols=ALL');
}
