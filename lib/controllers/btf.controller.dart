import 'package:cripton/providers/btf.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BtfController extends GetxController {
  static BtfController btfController = Get.find();
  static BtfProvider btfProvider = BtfProvider();

  final TextEditingController searchController = TextEditingController();

  RxBool connection = false.obs;
  RxList tickersList = [].obs;
  RxList filterList = [].obs;


  @override
  void onInit() {
    super.onInit();
    checkConnection();
  }

  checkConnection() async {
    _clearLists();

    Response response = await btfProvider.getConnection();
    if (response.statusCode == 200 && response.body[0] == 1) {
      connection.value = true;
      getTickers();
    } else {
      connection.value = false;
    }
    // print(connection.value);
  }

  getTickers() async {
    Response response = await btfProvider.getTickers();
    if (response.statusCode == 200) {
      for (var ticker in response.body) {
        tickersList.add(ticker);
      }
      filterTickers();
    }
  }

  filterTickers() {
    if (searchController.text.isNotEmpty) {
      filterList.value = tickersList.where((ticker) =>
          ticker[0].toUpperCase().contains(
              searchController.text.trim().toUpperCase())).toList();
    } else {
      filterList.value = RxList.from(tickersList);
    }
  }

  _clearLists() {
    tickersList.clear();
    filterList.clear();
  }
}
