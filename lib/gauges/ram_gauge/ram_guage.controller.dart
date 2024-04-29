import 'dart:async';

import 'package:get/get.dart';
import 'package:performance_monitor/gauges/ram_gauge/ram_gauge.state.dart';
import 'package:performance_monitor/perfomance_monitor_service.dart';

class RamGuageController extends GetxController with StateMixin<RamGuageState> {
  PerfomanceMonitorService service = Get.find();
  Timer? timer;
  var firstTime = true;
  @override
  void onInit() {
    super.onInit();
    change(RamGuageState.initialState(), status: RxStatus.success());
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      getData();
    });
  }

  getData() {
    final data = service.perfomanceData;
    if (firstTime) {
      change(
          state?.copyWith(
              ramUsed: data?.ram.usage.used,
              ramUsedValue: data?.ram.usedRamRawValue,
              totalRam: data?.ram.usage.total,
              totalRamValue: data?.ram.totalRamRawValue,
              firstRange: ((data?.ram.totalRamRawValue ?? 1.0) * 0.33),
              middleRange: ((data?.ram.totalRamRawValue ?? 1.0) * 0.66),
              lastRange: ((data?.ram.totalRamRawValue ?? 1.0) * 0.75)),
          status: RxStatus.success());
      firstTime = false;
    }
    change(
        state?.copyWith(
            ramUsed: data?.ram.usage.used,
            ramUsedValue: data?.ram.usedRamRawValue),
        status: RxStatus.success());
  }
}
