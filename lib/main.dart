import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_header/binds/main_bind.dart';
import 'package:invoice_header/view/invoice_header_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: MainBind(),
      home: const InvoiceHeader(),
    );
  }
}
