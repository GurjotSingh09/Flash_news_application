import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/Components/NavigationBar.dart';
import 'package:news_application/Components/NewsTileLoading.dart';
import 'package:news_application/Components/TrendingLoading.dart';
import 'package:news_application/Controller/NewsController.dart';
import 'package:news_application/pages/NewsDetailPage.dart';
import 'package:news_application/widgets/NewsTile.dart';
import 'package:news_application/widgets/TrendingCards.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final Newscontroller newsController = Get.put(Newscontroller());
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // floatingActionButton:MyBottomNav(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.dashboard),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Text(
                    "FLASH NEWS",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      newsController.getNews();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.person),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(()=>newsController.isTrending.value? Row(
                  children: [
                    Trendingloading(),
                    Trendingloading(),
                    Trendingloading(),
                  ],
                ):Row(
                    children: newsController.trendingNewsList
                        .map(
                          (e) => Trendingcards(
                        ontap: () {
                          Get.to(NewsDetailpage(news: e,));
                        },
                        imageUrl: e.urlToImage!,
                        title: e.title??"No Detail",

                        time: e.publishedAt??"30 min Ago",
                        Author: e.author ?? "Unknown",
                      ),
                    ).toList()),)
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(()=>newsController.isGetNews.value?Column(
                children: [
                  Newstileloading(),
                  Newstileloading(),
                ],
               ):Column(
                children: newsController.getNewsList
                    .map(
                      (e) => Newstile(
                    ontap: () {
                      Get.to(NewsDetailpage(news: e));
                    },
                    imageUrl:
                    e.urlToImage??'https://www.hindustantimes.com/ht-img/img/2024/09/02/550x309/aot_1725287334668_1725287372225.jpg',
                    title:
                    e.title??"no title",
                    time: e.publishedAt??"30 min ago",
                    Author: e.author??'Gurjot Singh',
                  ),
                ).toList(),
              ) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apple News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(()=>newsController.isGetApple.value?Column(
                children: [
                  Newstileloading(),
                  Newstileloading(),
                ],
              ):Column(
                children: newsController.apple10news
                    .map(
                      (e) => Newstile(
                    ontap: () {
                      Get.to(NewsDetailpage(news: e));
                    },
                    imageUrl:
                    e.urlToImage??"https://www.hindustantimes.com/ht-img/img/2024/09/02/550x309/aot_1725287334668_1725287372225.jpg",
                    title:
                    e.title??"no title",
                    time: e.publishedAt??"30 min ago",
                    Author: e.author??'Gurjot Singh',
                  ),
                )
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
