import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(
              image: AssetImage('assets/img/sinConexion.png'), width: 150),
          const SizedBox(height: 40.0),
          Text('Se ha perdido la conexión a internet',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 40.0),
          const Image(
            image: AssetImage('assets/img/loadingDataTr.gif'),
            width: 80,
          ),
        ],
      ),
    );
  }
}
