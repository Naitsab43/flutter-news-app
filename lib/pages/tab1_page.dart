import 'package:flutter/material.dart';
import 'package:news_app/theme/myTheme.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:provider/provider.dart';

import 'package:news_app/services/news_services.dart';


class Tab1Page extends StatefulWidget {

  @override
  _Tab1PageState createState() => _Tab1PageState();

}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewsService>(context);
    
    return Scaffold(
      body: newsServices.headlines.length == 0 ? 

        Center(
          child: CircularProgressIndicator(color: myTheme.accentColor,),
        )
        :
        NewsList(news: newsServices.headlines)

    );
 
  }

  @override
  bool get wantKeepAlive => true;

}