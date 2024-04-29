import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:performance_monitor/gauges/ram_gauge/ram_guage.controller.dart';
import 'package:performance_monitor/perfomance_monitor_service.dart';
import 'package:performance_monitor/screens/performance_monitor.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(1920, 480);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
        color: Colors.transparent,
        title: 'Performance Monitor',
        builder: (context, child) {
          _dependencies();
          return PerformanceMonitor();
        });
  }

  void _dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => PerfomanceMonitorService());
    Get.lazyPut(() => RamGuageController());
  }
}
