import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/theme/myTheme.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
    
            _CategoriesList(),
            Expanded(
              child: newsServices.isLoading ? 
              Center(child: CircularProgressIndicator(color: myTheme.accentColor,))
              :
              NewsList(news: newsServices.articlesSelectedCategory ?? []),
            )


          ],
        )
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int i) {

          final categoryName = categories[i].name;
          
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [

                _CategoryButton(category: categories[i]),
                SizedBox(height: 5,),
                Text("${ categoryName[0].toUpperCase() }${ categoryName.substring(1) }")

              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category category;


  _CategoryButton({required this.category}) ;

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){

        final newsService = Provider.of<NewsService>(context, listen: false);

        newsService.selectedCategory = category.name;

      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: category.name == newsService.selectedCategory ? 
          myTheme.accentColor : Colors.black54,
        ),
      ),
    );
  }
}