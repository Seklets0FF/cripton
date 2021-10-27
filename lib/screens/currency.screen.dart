import 'package:cripton/controllers/btf.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({Key? key}) : super(key: key);
  static BtfController btfController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CriptoN'),
      ),
      body: ListView.builder(
          itemCount: Get.arguments.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_getTitle(index)),
              subtitle: Text('${Get.arguments[index]}'),
            );
          }),
    );
  }

  String _getTitle(int index) {
    String _title = '';
    switch (index) {
      case 0:
        _title = 'Наименование валюты';
        break;
      case 1:
        _title = 'Среднее значение финансирования за последний час';
        break;
      case 2:
        _title = 'Цена последней наивысшей ставки';
        break;
      case 3:
        _title = 'Срок подачи заявок (в днях)';
        break;
      case 4:
        _title = 'Сумма 25 максимальных ставок';
        break;
      case 5:
        _title = 'Цена последнего минимального предложения';
        break;
      case 6:
        _title = 'Срок действия предложения (в днях)';
        break;
      case 7:
        _title = 'Сумма 25 минимальных ставок';
        break;
      case 8:
        _title = 'Сумма на которую изменилась последняя цена со вчерашнего дня';
        break;
      case 9:
        _title = 'Относительное изменение цены со вчерашнего дня';
        break;
      case 10:
        _title = 'Цена последней сделки';
        break;
      case 11:
        _title = 'Ежедневный объём';
        break;
      case 12:
        _title = 'Дневной максимум';
        break;
      case 13:
        _title = 'Дневной минимум';
        break;
      case 14:
        _title =
            'Сумма финансирования (доступная по мгновенной ставке возврата)';
        break;
    }
    return _title;
  }
}
