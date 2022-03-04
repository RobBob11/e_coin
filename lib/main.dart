import 'package:e_coin/pages/navigation.dart';
import 'package:e_coin/services/coins.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ServiceHome())],
      child: MaterialApp(
        title: 'E-coin',
        debugShowCheckedModeBanner: false,
        home: Navigation(),
      ),
    );
  }
}
