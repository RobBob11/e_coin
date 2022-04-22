import 'package:e_coin/models/chart_duration.dart';
import 'package:e_coin/models/coins.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/chart_data.dart';

class ChartService with ChangeNotifier {
  ChartService() {
    isLoading = true;
  }

  // lista para datos de la api
  List<List<double>> chartData = [];
  // lista para la grafica moldeada al objeto ohlc
  List<ChartSampleData> chartObjects = [];

  // la duración que llevara la gráfica nombre de la moneda y el label de los botones
  String duration = '1';
  String labelDuration = '1';
  String coinName = '';
  bool isLoading = true;

  // lista de duraciones soportadas
  List<DurationData> durationsData = [
    DurationData('1', '1D'), //dia
    DurationData('7', '1W'), // semana
    DurationData('14', '2W'), // 2 semanas
    DurationData('30', '1M'), // 1 mes
    DurationData('180', '6M'), // 6 meses
    DurationData('365', '1Y'), // 1 año
  ];

  get getDuration => duration;

  get getCoinName => coinName;

  set setDuration(String data) {
    duration = data;
    getChartDataByDuration(data);
    notifyListeners();
  }

  set setLabelDuration(String data) {
    labelDuration = data;
    notifyListeners();
  }

  set setCoinName(String name) {
    isLoading = true;
    coinName = name;
    duration = '1';
    getChartDataByDuration(duration);
    notifyListeners();
  }

  getChartDataByDuration(String duration) async {
    chartData = [];
    chartObjects = [];
    try {
      final url = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/$coinName/ohlc?vs_currency=usd&days=$duration');
      final response = await http.get(url);
      final data = chartDataFromMap(response.body);
      chartData.addAll(data);
      for (var i = 0; i < chartData.length; i++) {
        String dateAux = chartData[i][0].toString().substring(0, 10);

        chartObjects.add(ChartSampleData(
            x: DateTime.fromMillisecondsSinceEpoch(int.parse(dateAux) * 1000),
            high: chartData[i][2],
            low: chartData[i][3],
            open: chartData[i][1],
            close: chartData[i][4]));
        isLoading = false;
      }
    } catch (e) {}
    notifyListeners();
  }
}
