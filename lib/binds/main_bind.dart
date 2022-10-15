import 'package:get/get.dart';
import 'package:invoice_header/controller/invoice_controller.dart';

class MainBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvoiceController(), fenix: true);
  }
}
