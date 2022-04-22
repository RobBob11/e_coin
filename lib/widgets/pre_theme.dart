import 'package:flutter/material.dart';

class LoadingTheme extends StatelessWidget {
  const LoadingTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/img/loadingDataTr.gif'),
          width: 80,
        ),
      ),
    );
  }
}