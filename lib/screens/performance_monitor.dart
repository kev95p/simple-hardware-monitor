import 'package:flutter/material.dart';
import 'package:performance_monitor/gauges/ram_gauge/ram_guage.dart';

class PerformanceMonitor extends StatelessWidget {
  const PerformanceMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return const RamGauge();
  }
}
