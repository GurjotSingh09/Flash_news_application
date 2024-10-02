import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/Controller/NewsController.dart';
import 'package:news_application/pages/NewsDetailPage.dart';
import 'package:news_application/widgets/searchWidget.dart';

import '../widgets/NewsTile.dart';

class Articlepage extends StatelessWidget {
  const Articlepage({super.key});

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Article Page")),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: [
              Searchwidget(),
              const SizedBox(
                height: 20,
              ),
              Obx(
                    ()=>Column(
                children: newscontroller.getNewsList.map((e)=> Newstile(
                  ontap: () {
                    Get.to(NewsDetailpage(news: e));
                  },
                  imageUrl:
                  e.urlToImage??'https://www.hindustantimes.com/ht-img/img/2024/09/02/550x309/Sumit-Antil-will-defend-his-javelin--F64--title-at_1725300211838_1725300242534.jpeg',
                  title:
                  e.title??'Sumit Antil breaks Paralympic record to win javelin gold, defends title in Paris',
                  time: e.publishedAt??'2 Days Ago',
                  Author:e.author??'Gurjot Singh',
                ),).toList(),
              ),)
            ],
          ),

        ),
      ),
    );
  }
}
