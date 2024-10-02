import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/model/newsModel.dart';

class NewsDetailpage extends StatelessWidget {
  const NewsDetailpage({super.key, required this.news});

  final Newsmodel news;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_ios_new_outlined),
                              Text('Back'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              news.urlToImage??'https://www.hindustantimes.com/ht-img/img/2024/09/02/550x309/aot_1725287334668_1725287372225.jpg',
                              fit: BoxFit.fill,
                            ),
                          ))
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                     news.title??"no title",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(news.publishedAt??'30 min ago',style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                       CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red,
                        child: Text(news.author![0]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(news.author??"Gurjot Singh",
                            style: TextStyle(
                                fontSize: 15,
                                color:
                                Theme.of(context).colorScheme.secondaryContainer)
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(
                      height: 20,
                    ),

                  Text(news.description??"no description",
                      style: TextStyle(
                          fontSize: 15,
                          color:
                          Theme.of(context).colorScheme.secondaryContainer)
                  ),
              
                ],
              ),
            ),

        ),
      ),
    );
  }
}
