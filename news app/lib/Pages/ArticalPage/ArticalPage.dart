import 'package:flutter/material.dart';
import 'package:flutter_application_2/Controller/NewsController.dart';
import 'package:flutter_application_2/Pages/ArticalPage/Widgets/SearchWidget.dart';
import 'package:flutter_application_2/Pages/NewDetails/NewsDetails.dart';
import 'package:get/get.dart';

import '../HomePage/Widgets/NewsTile.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20),
              Obx(
                () => Column(
                  children: newsController.newsForYouList
                      .map(
                        (e) => NewsTile(
                          ontap: () {
                            Get.to(NewsDetailsPage(news: e));
                          },
                          imageUrl: e.urlToImage ??
                              "https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/01/16/317_1705413514.jpg",
                          title: e.title!,
                          author: e.author ?? "Unknown",
                          time: e.publishedAt!,
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
