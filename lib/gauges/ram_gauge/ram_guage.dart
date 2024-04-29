import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:performance_monitor/gauges/ram_gauge/ram_gauge.state.dart';
import 'package:performance_monitor/gauges/ram_gauge/ram_guage.controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RamGauge extends GetView<RamGuageController> {
  const RamGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        if (state != null) {
          return _buildGauge(state);
        }
        return const Text("No data");
      },
    );
  }

  SfRadialGauge _buildGauge(RamGuageState state) {
    return SfRadialGauge(
        title: const GaugeTitle(
            text: 'RAM',
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(
              axisLabelStyle: GaugeTextStyle(color: Colors.white, fontSize: 15),
              minimum: 0.0,
              maximum: state.totalRamValue,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: state.firstRange,
                    color: Colors.green,
                    startWidth: 15,
                    endWidth: 15),
                GaugeRange(
                    startValue: state.firstRange,
                    endValue: state.lastRange,
                    color: Colors.orange,
                    startWidth: 15,
                    endWidth: 15),
                GaugeRange(
                    startValue: state.middleRange,
                    endValue: state.totalRamValue,
                    color: Colors.red,
                    startWidth: 15,
                    endWidth: 15)
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: state.ramUsedValue,
                  enableAnimation: true,
                  animationType: AnimationType.bounceOut,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Text(state.ramUsed,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    angle: 90,
                    positionFactor: 0.5)
              ])
        ]);
  }
}
