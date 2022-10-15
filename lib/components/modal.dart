import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_header/controller/invoice_controller.dart';

class Modal extends StatelessWidget {
  const Modal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InvoiceController controller = Get.find();
    controller.filteredModalList.value = controller.modalList;
    return Column(
      children: [
        TextField(
          onChanged: (value) => controller.filteredModalList.value = controller
              .modalList
              .where((listItem) => listItem['desc']
                  .toString()
                  .toUpperCase()
                  .contains(value.toUpperCase()))
              .toList(),
        ),
        const SizedBox(height: 24),
        Obx(() => Column(
              children: [
                ...controller.filteredModalList
                    .map<Widget>((Map<String, dynamic> option) => ListTile(
                          leading: Text("${option['code']}"),
                          title: Text(option['desc']),
                          onTap: () =>
                              controller.selectListItem(selectedItem: option),
                        ))
                    .toList()
              ],
            ))
      ],
    );
  }
}
