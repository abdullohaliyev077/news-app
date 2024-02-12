import 'dart:convert';


import 'package:flutter_application_2/Model/NewsModel.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class NewsController extends GetxController {
  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> searchNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> apple5News = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> tesla5News = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> business5News = <NewsModel>[].obs;
  RxBool isTrandingLoading = false.obs;
  RxBool isNewsForULoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isBuisLoading = false.obs;
  RxBool isSpeeking = false.obs;
  FlutterTts flutterTts = FlutterTts();

  void onInit() async {
    super.onInit();
    getNewsForYou();
    getTrandingNews();
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
  }

  Future<void> getTrandingNews() async {
    isTrandingLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          trandingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isTrandingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForULoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        newsForYou5.value = newsForYouList.sublist(0, 5).obs;
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForULoading.value = false;
  }

  Future<void> getAppleNews() async {
    isAppleLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=apple&from=2024-01-21&to=2024-01-21&sortBy=popularity&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          appleNewsList.add(NewsModel.fromJson(news));
        }
        apple5News.value = appleNewsList.sublist(0, 5).obs;
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isAppleLoading.value = false;
  }

  Future<void> getTeslaNews() async {
    isTeslaLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-12-22&sortBy=publishedAt&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        tesla5News.value = teslaNewsList.sublist(0, 5).obs;
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isTeslaLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBuisLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          businessNewsList.add(NewsModel.fromJson(news));
        }
        business5News.value = businessNewsList.sublist(0, 5).obs;
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isBuisLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isNewsForULoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=$search&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        newsForYouList.clear();
        int i = 0;
        for (var news in articals) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForULoading.value = false;
  }

  Future<void> speak(String text) async {
    isSpeeking.value = true;
    await flutterTts.setLanguage("en-UZ");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
    isSpeeking.value = false;
  }

  void stop() async {
    await flutterTts.stop();
    isSpeeking.value = false;
  }
}
