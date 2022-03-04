import 'package:flutter/material.dart';
import '../widgets/customAppbar.dart';

class Market extends StatefulWidget {
  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarspl("Mercado"),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Market",
            style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
