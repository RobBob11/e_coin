import 'package:e_coin/pages/home.dart';
import 'package:e_coin/pages/market.dart';
import 'package:e_coin/pages/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);

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
      currentIndex: navModel.currentPage,
      onTap: (i) => navModel.currentPage = i,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child:
                const ImageIcon(AssetImage('assets/img/home.png'), size: 22.0),
          ),
          activeIcon: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: const ImageIcon(
                AssetImage('assets/img/home.png'),
                size: 22.0,
              )),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child:
                const ImageIcon(AssetImage('assets/img/stats.png'), size: 22.0),
          ),
          activeIcon: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: const ImageIcon(AssetImage('assets/img/stats.png'),
                  size: 22.0)),
          label: 'Mercado',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: const ImageIcon(AssetImage('assets/img/document.png'),
                size: 22.0),
          ),
          activeIcon: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: const ImageIcon(AssetImage('assets/img/document.png'),
                  size: 22.0)),
          label: 'Noticias',
        ),
      ],
    );
  }
}
