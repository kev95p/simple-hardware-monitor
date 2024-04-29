import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RamGuageState {
  String ramUsed;
  String totalRam;

  double ramUsedValue;
  double totalRamValue;

  double firstRange;
  double middleRange;
  double lastRange;
  RamGuageState({
    required this.ramUsed,
    required this.totalRam,
    required this.ramUsedValue,
    required this.totalRamValue,
    required this.firstRange,
    required this.middleRange,
    required this.lastRange,
  });

  factory RamGuageState.initialState() => RamGuageState(
      ramUsed: "0.0GB",
      totalRam: "1.0GB",
      ramUsedValue: 0.0,
      totalRamValue: 1.0,
      firstRange: 0.1,
      middleRange: 0.5,
      lastRange: 0.7);

  RamGuageState copyWith({
    String? ramUsed,
    String? totalRam,
    double? ramUsedValue,
    double? totalRamValue,
    double? firstRange,
    double? middleRange,
    double? lastRange,
  }) {
    return RamGuageState(
      ramUsed: ramUsed ?? this.ramUsed,
      totalRam: totalRam ?? this.totalRam,
      ramUsedValue: ramUsedValue ?? this.ramUsedValue,
      totalRamValue: totalRamValue ?? this.totalRamValue,
      firstRange: firstRange ?? this.firstRange,
      middleRange: middleRange ?? this.middleRange,
      lastRange: lastRange ?? this.lastRange,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ramUsed': ramUsed,
      'totalRam': totalRam,
      'ramUsedValue': ramUsedValue,
      'totalRamValue': totalRamValue,
      'firstRange': firstRange,
      'middleRange': middleRange,
      'lastRange': lastRange,
    };
  }

  factory RamGuageState.fromMap(Map<String, dynamic> map) {
    return RamGuageState(
      ramUsed: map['ramUsed'] as String,
      totalRam: map['totalRam'] as String,
      ramUsedValue: map['ramUsedValue'] as double,
      totalRamValue: map['totalRamValue'] as double,
      firstRange: map['firstRange'] as double,
      middleRange: map['middleRange'] as double,
      lastRange: map['lastRange'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory RamGuageState.fromJson(String source) =>
      RamGuageState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RamGuageState(ramUsed: $ramUsed, totalRam: $totalRam, ramUsedValue: $ramUsedValue, totalRamValue: $totalRamValue, firstRange: $firstRange, middleRange: $middleRange, lastRange: $lastRange)';
  }

  @override
  bool operator ==(covariant RamGuageState other) {
    if (identical(this, other)) return true;

    return other.ramUsed == ramUsed &&
        other.totalRam == totalRam &&
        other.ramUsedValue == ramUsedValue &&
        other.totalRamValue == totalRamValue &&
        other.firstRange == firstRange &&
        other.middleRange == middleRange &&
        other.lastRange == lastRange;
  }

  @override
  int get hashCode {
    return ramUsed.hashCode ^
        totalRam.hashCode ^
        ramUsedValue.hashCode ^
        totalRamValue.hashCode ^
        firstRange.hashCode ^
        middleRange.hashCode ^
        lastRange.hashCode;
  }
}
