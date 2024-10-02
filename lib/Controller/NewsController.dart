import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/model/newsModel.dart';


class Newscontroller extends GetxController{


  RxList<Newsmodel> trendingNewsList = <Newsmodel>[].obs;
  RxList<Newsmodel> getNewsList = <Newsmodel>[].obs;
  RxList<Newsmodel> getAppleList = <Newsmodel>[].obs;
  RxBool isTrending = false.obs;
  RxBool isGetNews = false.obs;
  //RxList<Newsmodel> getNews10 = <Newsmodel>[].obs;
  RxBool isGetApple = false.obs;
  RxBool isTesla = false.obs;
  RxList<Newsmodel> apple10news = <Newsmodel>[].obs;




  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getNews();
    getTrendingNews();
    getAppleNews();
  }

  Future<void> getTrendingNews() async {
    isTrending.value = true;
    var baseURL = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=68d05b89303741faa8dbb9c2e566175c';

    try {
      var response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          trendingNewsList.add(Newsmodel.fromJson(news));
        }
      }
      else {
        print("Something went wrong in Trending News...");
      }
    } catch(ex){
      print(ex);
    }
    isTrending.value = false;

}
  Future<void> getNews() async {
    isGetNews.value = true;
    var baseURL = 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=68d05b89303741faa8dbb9c2e566175c';
    try {
      var response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          getNewsList.add(Newsmodel.fromJson(news));
        }

      }
      else {
        print("Something went wrong in Trending News...");
      }
    } catch(ex){
      print(ex);
    }
    isGetNews.value = false;

  }
  Future<void> getAppleNews() async {
    isGetApple.value=true;
    var baseURL = 'https://newsapi.org/v2/everything?q=apple&from=2024-09-18&to=2024-09-18&sortBy=popularity&apiKey=68d05b89303741faa8dbb9c2e566175c';

    try {
      var response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          getAppleList.add(Newsmodel.fromJson(news));
        }
        apple10news.value = getAppleList.sublist(5,15).obs ;

      }
      else {
        print("Something went wrong in Trending News...");
      }
    } catch(ex){
      print(ex);
    }
    isGetApple.value=false;

  }

  Future<void> searchNews(String search) async {
    isGetNews.value = true;
    var baseURL = 'https://newsapi.org/v2/everything?q=$search&apiKey=68d05b89303741faa8dbb9c2e566175c';

    try {
      var response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        getNewsList.clear();
        int i=0;
        for (var news in articles) {
          i++;
          getNewsList.add(Newsmodel.fromJson(news));
          if(i==10){
            break;
          }
        }
      }
      else {
        print("Something went wrong in Trending News...");
      }
    } catch(ex){
      print(ex);
    }
    isGetNews.value = false;

  }

}