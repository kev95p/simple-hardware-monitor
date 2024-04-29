import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:performance_monitor/monitor_info.dart';
import 'package:performance_monitor/perfomance_data.dart';

class PerfomanceMonitorService extends GetxService {
  Timer? timer;
  PerfomanceData? perfomanceData;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      perfomanceData = await getData();
    });
  }

  Future<PerfomanceData> getData() async {
    try {
      Dio dio = Get.find();
      final response = await dio.get("http://192.168.30.1:8085/data.json");
      final monitor = MonitorInfo.fromJson(response.data);
      final perfomanceData = PerfomanceData.fromMonitorInfo(monitor);
      print(perfomanceData.toString());
      return perfomanceData;
    } catch (err) {
      print(err);
      throw Exception(err.toString());
    }
  }
}
