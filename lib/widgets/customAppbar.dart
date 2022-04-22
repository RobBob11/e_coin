import 'package:e_coin/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBars extends AppBar {
  AppBars()
      : super(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Image(
                  image: AssetImage('assets/img/dragon.png'), width: 40.0),
              const Padding(padding: EdgeInsets.only(right: 12.0)),
              // get the theme for notifier
              Consumer<ThemeNotifier>(
                  builder: (context, notifier, child) => Image(
                      image: notifier.darkTheme!
                          ? const AssetImage('assets/img/logo-blanco.png')
                          : const AssetImage('assets/img/logo-negro.png'),
                      width: 75.0)),
            ],
          ),
          elevation: 1,
          actions: [
            Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => IconButton(
                    onPressed: () {
                      // chenge theme
                      notifier.toggleTheme();
                    },
                    icon: ImageIcon(
                      notifier.darkTheme!
                          ? const AssetImage('assets/img/luz.png')
                          : const AssetImage('assets/img/nig.png'),
                    ))),
          ],
        );
}

class AppBarspl extends AppBar {
  String titulo;
  AppBarspl(this.titulo, BuildContext context)
      : super(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(titulo, style: Theme.of(context).textTheme.headline2)
            ],
          ),
          elevation: 1,
        );
}

class AppBarsCoins extends AppBar {
  String titulo;
  AppBarsCoins(this.titulo, BuildContext context)
      : super(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(titulo, style: Theme.of(context).textTheme.headline2)
            ],
          ),
          elevation: 1,
        );
}