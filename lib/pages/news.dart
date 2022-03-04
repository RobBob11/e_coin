import 'package:flutter/material.dart';
import '../widgets/customAppbar.dart';

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarspl("Noticias"),
      body: Container(
        alignment: Alignment.center,
        child: const Text("News",
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
