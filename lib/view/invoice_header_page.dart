import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_header/components/invoice_field.dart';
import 'package:invoice_header/controller/invoice_controller.dart';
import 'package:invoice_header/data/mocked_data.dart';

class InvoiceHeader extends StatelessWidget {
  const InvoiceHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InvoiceController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cabeçalho de nota"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cabeçalho da Nota:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text("Empresa"),
            const SizedBox(height: 8),
            InvoiceField(
              fieldCode: controller.companyCode,
              fieldDescription: controller.companyDescription,
              data: MockedData.companies,
              onTap: () => controller.openModal(
                  mockedList: MockedData.companies,
                  selectedFieldType: FieldTypes.company),
            ),
            const SizedBox(height: 16),
            const Text("Parceiro"),
            const SizedBox(height: 8),
            InvoiceField(
              fieldCode: controller.partnerCode,
              fieldDescription: controller.partnerDescription,
              data: MockedData.partners,
              onTap: () => controller.openModal(
                  mockedList: MockedData.partners,
                  selectedFieldType: FieldTypes.partner),
            ),
            const SizedBox(height: 16),
            const Text("Linha de Procedimento"),
            const SizedBox(height: 8),
            InvoiceField(
              fieldCode: controller.procedureLineCode,
              fieldDescription: controller.procedureLineDescription,
              data: MockedData.procedureLines,
              onTap: () => controller.openModal(
                  mockedList: MockedData.procedureLines,
                  selectedFieldType: FieldTypes.procedureLine),
            )
          ],
        ),
      ),
    );
  }
}
