import 'package:flutter/material.dart';
import 'package:flutter_application_2/Components/NewsTileLoading.dart';
import 'package:flutter_application_2/Components/TrandingLoadingCard.dart';
import 'package:flutter_application_2/Controller/NewsController.dart';
import 'package:flutter_application_2/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:flutter_application_2/Pages/HomePage/Widgets/TrandingCard.dart';
import 'package:flutter_application_2/Pages/NewDetails/NewsDetails.dart';
import 'package:flutter_application_2/Pages/Profile/ProfilePage.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  const Text(
                    "NEWS APP",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
                      }, icon: Icon(Icons.person))
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
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
              const SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isTrandingLoading.value
                        ? const Row(
                            children: [
                              TrandingLoadingCard(),
                              TrandingLoadingCard(),
                            ],
                          )
                        : Row(
                            children: newsController.trandingNewsList
                                .map(
                                  (e) => TrandingCard(
                                    ontap: () {
                                      Get.to(NewsDetailsPage(
                                        news: e,
                                      ));
                                    },
                                    imageUrl: e.urlToImage!,
                                    title: e.title!,
                                    author: e.author ?? "Unknown",
                                    tag: "Tranding no 1",
                                    time: e.publishedAt!,
                                  ),
                                )
                                .toList(),
                          ),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News For you",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isNewsForULoading.value
                    ? Column(
                        children: [
                          NewsTileLoading(),
                          NewsTileLoading(),
                          NewsTileLoading(),
                        ],
                      )
                    : Column(
                        children: newsController.newsForYou5
                            .map(
                              (e) => NewsTile(
                                ontap: () {
                                  Get.to(NewsDetailsPage(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg",
                                title: e.title!,
                                author: e.author ?? "Unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tesla News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isTeslaLoading.value
                    ? Column(
                        children: [
                          NewsTileLoading(),
                          NewsTileLoading(),
                          NewsTileLoading(),
                        ],
                      )
                    : Column(
                        children: newsController.tesla5News
                            .map(
                              (e) => NewsTile(
                                ontap: () {
                                  Get.to(NewsDetailsPage(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg",
                                title: e.title!,
                                author: e.author ?? "Unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isAppleLoading.value
                        ? const Row(
                            children: [
                              TrandingLoadingCard(),
                              TrandingLoadingCard(),
                            ],
                          )
                        : Row(
                            children: newsController.apple5News
                                .map(
                                  (e) => TrandingCard(
                                    ontap: () {
                                      Get.to(NewsDetailsPage(
                                        news: e,
                                      ));
                                    },
                                    imageUrl: e.urlToImage!,
                                    title: e.title!,
                                    author: e.author ?? "Unknown",
                                    tag: "Tranding no 1",
                                    time: e.publishedAt!,
                                  ),
                                )
                                .toList(),
                          ),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isBuisLoading.value
                    ? Column(
                        children: [
                          NewsTileLoading(),
                          NewsTileLoading(),
                          NewsTileLoading(),
                        ],
                      )
                    : Column(
                        children: newsController.business5News
                            .map(
                              (e) => NewsTile(
                                ontap: () {
                                  Get.to(NewsDetailsPage(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg",
                                title: e.title!,
                                author: e.author ?? "Unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
