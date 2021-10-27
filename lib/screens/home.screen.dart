import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cripton/controllers/btf.controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final BtfController btfController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CriptoN'),
          actions: [
            IconButton(
                onPressed: () => btfController.checkConnection(),
                icon: const Icon(Icons.update))
          ],
        ),
        body: Column(
          children: [
            Obx(() => Container(
                  width: double.infinity,
                  color: btfController.connection.value
                      ? Colors.green
                      : Colors.red,
                  child: Center(
                    child: TextField(
                      controller: btfController.searchController,
                      decoration: InputDecoration(
                          hintText: 'Крипта',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () => btfController.filterTickers(),
                          )),
                    ),
                  ),
                )),
            Obx(() => Expanded(
                  child: ListView.builder(
                      itemCount: btfController.filterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('${btfController.filterList[index][0]}'),
                          subtitle:
                              Text('${btfController.filterList[index][10]}'),
                          onTap: () => Get.toNamed('/currency',
                              arguments: btfController.filterList[index]),
                        );
                      }),
                )),
          ],
        ));
  }
}
