import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_header/components/modal.dart';

class InvoiceController extends GetxController {
  final companyCode = 0.obs;
  final companyDescription = "".obs;

  final partnerCode = 0.obs;
  final partnerDescription = "".obs;

  final procedureLineCode = 0.obs;
  final procedureLineDescription = "".obs;

  final modalList = <Map<String, dynamic>>[].obs;
  final filteredModalList = <Map<String, dynamic>>[].obs;
  final fieldType = Rx<FieldTypes>(FieldTypes.company);

  void openModal({
    required List<Map<String, dynamic>> mockedList,
    required FieldTypes selectedFieldType,
  }) {
    modalList.value = mockedList;
    fieldType.value = selectedFieldType;
    Get.defaultDialog(
        title: "Selecione uma das opções abaixo:",
        titlePadding: const EdgeInsets.all(16),
        titleStyle: const TextStyle(fontSize: 16),
        content: const Modal(),
        contentPadding: const EdgeInsets.only(left: 32, right: 32, bottom: 16));
  }

  void selectListItem({required Map<String, dynamic> selectedItem}) {
    if (Get.isDialogOpen!) {
      switch (fieldType.value) {
        case FieldTypes.procedureLine:
          procedureLineCode.value = selectedItem['code'];
          procedureLineDescription.value = selectedItem['desc'];
          break;
        case FieldTypes.company:
          companyCode.value = selectedItem['code'];
          companyDescription.value = selectedItem['desc'];
          break;
        case FieldTypes.partner:
          partnerCode.value = selectedItem['code'];
          partnerDescription.value = selectedItem['desc'];
          break;
      }

      Get.back();
    }
  }
}

enum FieldTypes { company, partner, procedureLine }
