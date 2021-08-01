import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/theme/myTheme.dart';

class NewsList extends StatelessWidget {

  final List<Article> news;

  const NewsList({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int i) {

        return _News(news: this.news[i], index: i,);
      },
    );
  }
}

class _News extends StatelessWidget {

  final Article news;
  final int index;

  const _News({
    required this.news,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        _TopBarCard(news: news, index: index,),
        _CardTitle(news: news),
        _CardImage(news: news),
        _CardBody(news: news),
        SizedBox(height: 10,),
        _CardButtons(),
        Divider()

      ],
    );
  }

}

class _CardButtons extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          RawMaterialButton(
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: (){},
            child: Icon(Icons.star_border),
          ),

          SizedBox(width: 10,),

          RawMaterialButton(
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: (){},
            child: Icon(Icons.more),
          ),

        ],
      ),
    );
  }
}

class _CardBody extends StatelessWidget {

  final Article news;

  const _CardBody({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(news.description),
    );
  }
}

class _CardImage extends StatelessWidget {

  final Article news;

  const _CardImage({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: news.urlToImage != null ? 
            FadeInImage(
              placeholder: AssetImage("assets/giphy.gif"),
              image: NetworkImage(news.urlToImage!),
            )
            :
            FadeInImage(
            placeholder: AssetImage("assets/giphy.gif"),
            image: AssetImage("assets/no-image.png"),
          ),
        ),
      ),
    );
  }
}


        

class _CardTitle extends StatelessWidget {

  final Article news;

  const _CardTitle({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(news.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TopBarCard extends StatelessWidget {

  final Article news;
  final int index;

  const _TopBarCard({
    required this.news,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [

          Text("${index + 1}. ", style: TextStyle(color: myTheme.accentColor),),
          Text("${news.source.name }. ")

        ],
      ),
    );
  }
}