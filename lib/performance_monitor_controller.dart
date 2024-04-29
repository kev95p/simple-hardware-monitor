import 'dart:async';

import 'package:get/get.dart';
import 'package:performance_monitor/perfomance_data.dart';
import 'package:performance_monitor/perfomance_monitor_service.dart';

class PerfomanceMonitorController extends GetxController
    with StateMixin<PerfomanceData> {
  Timer? timer;

  var showAnimations = true.obs;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      fetchInfo();
    });
  }

  fetchInfo() async {
    change(null, status: RxStatus.loading());
    try {
      PerfomanceMonitorService service = Get.find();
      var perfomanceData = await service.getData();
      print(perfomanceData.toString());
      change(perfomanceData, status: RxStatus.success());
      if (showAnimations.isTrue) {
        showAnimations.value = false;
      }
    } on Exception catch (err) {
      change(null, status: RxStatus.error(err.toString()));
    }
  }
}
