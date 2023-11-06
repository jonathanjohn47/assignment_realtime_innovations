import 'package:get/get.dart';

class CustomDateGetController extends GetxController {
  final bool noDateOption;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  bool datePicked = false;

  RxInt buttonClicked = 0.obs;

  CustomDateGetController({required this.noDateOption});

  @override
  void onInit() {
    datePicked = !noDateOption;
    super.onInit();
  }
}
