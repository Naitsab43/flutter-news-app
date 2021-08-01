
import 'package:flutter/material.dart';
import 'package:news_app/pages/tab1_page.dart';
import 'package:news_app/pages/tab2_page.dart';
import 'package:news_app/providers/navigation_provider.dart';
import 'package:news_app/theme/myTheme.dart';

import 'package:provider/provider.dart';


class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _Navigation(),
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navigationProvider.paginaActual,
      onTap: (i) => navigationProvider.paginaActual = i,
      selectedItemColor: myTheme.accentColor,
      items: [

        BottomNavigationBarItem(
          label: "Para Ti",
          icon: Icon(Icons.person_outline)
        ),
        BottomNavigationBarItem(
          label: "Encabezados",
          icon: Icon(Icons.public)
        ),
        
      ],
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      controller: navigationProvider.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [

        Tab1Page(),
        Tab2Page()

      ],
    );
  }
}


