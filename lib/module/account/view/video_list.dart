import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List videoLinks = [
    {
      'image': 'assets/images/imagethree.jpeg',
      'title': 'Instructional video on how to take BP',
      'link': 'https://www.youtube.com/watch?v=0tGyRJxbYpQ',
    },
    {
      'image': 'assets/images/imagefour.jpeg',
      'title': 'Video on treatment of BP without medication',
      'link': 'https://www.youtube.com/watch?v=hXC304-cFaU',
    },
    // {
    //   'image': 'assets/images/imagetwo.jpeg',
    //   'title': 'Complete these steps to obtain treatment',
    //   'link': 'https://www.link2labs.com/home/home',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Some video tutorials for you',
          ),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          color: kWhiteColor,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: videoLinks
                .map((e) => Card(
                      elevation: 2.0,
                      child: ListTile(
                        onTap: () async {
                          await launchUrl(Uri.parse(e['link']));
                        },
                        leading: Image.asset(
                          e['image'],
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          e['title'],
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        subtitle: Text(
                          e['link'],
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.blue,
                                  ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
