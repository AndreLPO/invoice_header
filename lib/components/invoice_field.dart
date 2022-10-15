import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceField extends StatelessWidget {
  const InvoiceField({
    Key? key,
    required this.fieldCode,
    required this.fieldDescription,
    required this.data,
    required this.onTap,
  }) : super(key: key);
  final Rx<int> fieldCode;
  final Rx<String> fieldDescription;
  final List<Map<String, dynamic>> data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: screenSize.width),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              child: Obx(
                () => Text(
                  "${fieldCode.value}",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Obx(
                () => Text(fieldDescription.value,
                    style: const TextStyle(fontSize: 18)),
              ),
            )),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
