class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.open,
    required this.close,
    required this.low,
    required this.high,
  });

  DateTime x;
  num open;
  num close;
  num low;
  num high;

  @override
  String toString() {
    // TODO: implement toString
    return '${x}';
  }
}