import 'package:flutter/material.dart';
import 'package:news_app/modules/Screens/webview_screen.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({Key? key,required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    String imagenull = 'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg';
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(data['url'])));
      },
      child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(data['urlToImage'] is String? data['urlToImage'] : imagenull),
                      fit: BoxFit.cover
                  )
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        data['title'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1
                        ),
                      ),
                    Text(
                      data['publishedAt'],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}
