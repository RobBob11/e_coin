import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../main.dart';

class AppBars extends AppBar {
  AppBars()
      : super(
          backgroundColor: HexColor("#FFFFFF"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(image: AssetImage('assets/img/dragon.png'), width: 40.0),
              Padding(padding: EdgeInsets.only(right: 12.0)),
              Image(
                image: AssetImage('assets/img/logo-negro.png'),
                width: 75.0,
              )
            ],
          ),
          elevation: 0,
        );
}

class AppBarspl extends AppBar {
  String titulo;
  AppBarspl(this.titulo)
      : super(
          backgroundColor: HexColor("#FFFFFF"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          elevation: 0,
        );
}
