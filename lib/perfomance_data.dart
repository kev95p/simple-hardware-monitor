import 'package:performance_monitor/monitor_info.dart';

class PerfomanceData {
  ComponentRam ram;
  CPU cpu;
  GPU gpu;

  PerfomanceData({
    required this.ram,
    required this.cpu,
    required this.gpu,
  });

  @override
  String toString() {
    return """
      ram { 
        load => max: ${ram.load.max}, min: ${ram.load.min}, value: ${ram.load.value} 
        usage => free ${ram.usage.free}, used: ${ram.usage.used}, total: ${ram.usage.total}
        }
    """;
  }

  static PerfomanceData _parseData(List<MonitorInfo> info) {
    final ramData =
        info.firstWhere((element) => element.text == "Generic Memory").children;
    return PerfomanceData(
        ram: ComponentRam(
            load: ComponentValue(
                min: ramData
                    .firstWhere((element) => element.text == "Load")
                    .children
                    .first
                    .min,
                value: ramData
                    .firstWhere((element) => element.text == "Load")
                    .children
                    .first
                    .value,
                max: ramData
                    .firstWhere((element) => element.text == "Load")
                    .children
                    .first
                    .max),
            usage: _parseUsageInPercentageMainRam(ramData)),
        cpu: CPU(
            name: "",
            temp: ComponentValue(min: "", value: "", max: ""),
            load: ComponentValue(min: "", value: "", max: "")),
        gpu: GPU(
            name: "",
            temp: ComponentValue(min: "min", value: "", max: ""),
            load: ComponentValue(min: "", value: "", max: ""),
            memory: ComponentRam(
                load: ComponentValue(min: "", value: "", max: ""),
                usage: UsageInPercentage(free: "", used: "", total: ""))));
  }

  static UsageInPercentage _parseUsageInPercentageMainRam(
      List<MonitorInfo> ramData) {
    final ramUsedMemory = ramData
        .firstWhere((element) => element.text == "Data")
        .children
        .firstWhere((element) => element.text == "Used Memory")
        .value
        .replaceAll("GB", "GB");
    final ramAvailableMemory = ramData
        .firstWhere((element) => element.text == "Data")
        .children
        .firstWhere((element) => element.text == "Available Memory")
        .value;
    final ramTotal = (double.parse(ramUsedMemory.replaceAll("GB", "")) +
            double.parse(ramAvailableMemory.replaceAll("GB", "")))
        .toStringAsFixed(2);

    return UsageInPercentage(
        free: ramAvailableMemory, used: ramUsedMemory, total: "$ramTotal GB");
  }

  factory PerfomanceData.fromMonitorInfo(MonitorInfo info) =>
      _parseData(info.children.first.children);
}

class GPU {
  String name;
  ComponentValue temp;
  ComponentValue load;
  ComponentRam memory;

  GPU({
    required this.name,
    required this.temp,
    required this.load,
    required this.memory,
  });
}

class CPU {
  String name;
  ComponentValue temp;
  ComponentValue load;

  CPU({
    required this.name,
    required this.temp,
    required this.load,
  });
}

class ComponentValue {
  String min;
  String value;
  String max;

  ComponentValue({
    required this.min,
    required this.value,
    required this.max,
  });
}

class UsageInPercentage {
  String free;
  String used;
  String total;

  UsageInPercentage({
    required this.free,
    required this.used,
    required this.total,
  });
}

class ComponentRam {
  ComponentValue load;
  UsageInPercentage usage;

  double get totalRamRawValue {
    return double.parse(usage.total.replaceAll("GB", ""));
  }

  double get usedRamRawValue {
    return double.parse(usage.used.replaceAll("GB", ""));
  }

  ComponentRam({
    required this.load,
    required this.usage,
  });
}
