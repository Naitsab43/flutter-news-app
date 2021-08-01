import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/providers/navigation_provider.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/theme/myTheme.dart';
import 'package:news_app/pages/tabs_page.dart';
 
void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: TabsPage(),
      theme: myTheme,
    );

  }

}