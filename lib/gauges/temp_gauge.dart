import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TempGauge extends StatelessWidget {
  const TempGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        title: const GaugeTitle(
            text: 'Speedometer',
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10)
          ], pointers: const <GaugePointer>[
            NeedlePointer(value: 90)
          ], annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text('90.0',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }
}
