import 'package:e_coin/pages/home.dart';
import 'package:e_coin/pages/market.dart';
import 'package:e_coin/pages/news.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _NavBar(),
      ),
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController = new PageController();

  int get currentPage => _currentPage;

  set currentPage(int val) {
    _currentPage = val;
    _pageController.animateToPage(val,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: NavigationModel._pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[Home(), Market(), News()],
    );
  }
}

class _NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<_NavigationModel>(context);

    // barra
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: navModel.currentPage,
      onTap: (i) => navModel.currentPage = i,
      type: BottomNavigationBarType.fixed,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: ImageIcon(AssetImage('assets/img/home.png'), size: 22.0),
          ),
          activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: ImageIcon(
                AssetImage('assets/img/home.png'),
                size: 22.0,
              )),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: ImageIcon(AssetImage('assets/img/stats.png'), size: 22.0),
          ),
          activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: ImageIcon(AssetImage('assets/img/stats.png'), size: 22.0)),
          label: 'Mercado',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: ImageIcon(AssetImage('assets/img/document.png'), size: 22.0),
          ),
          activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child:
                  ImageIcon(AssetImage('assets/img/document.png'), size: 22.0)),
          label: 'Noticias',
        ),
      ],
      selectedItemColor: HexColor("#4054E9"),
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: HexColor("#4054E9"),
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(
        color: HexColor("#4054E9"),
        fontSize: 12,
      ),
      unselectedItemColor: HexColor("#747E98"),
    );
  }
}
