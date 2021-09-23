import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

import '../cubi.dart';

class DisplayItemScreen extends StatelessWidget {
  final Datas post;
  final int index;

  const DisplayItemScreen({Key? key, required this.post, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xFFec5872)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Create'),
            ),
          ),
          const Icon(Icons.more_vert),
        ],
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Hero(
          tag: 'yearbookitem$index',
          child: Texts(
            color: Colors.black87,
            title: post.yearbook_name,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Visibility(
                visible: post.yearbook_banner.isEmpty ? false:true,
                child: Image.network(post.yearbook_banner, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Html(
                style: {
                  'html': Style(textAlign: TextAlign.center),
                },
                data: post.app_preview_description,
              ),
              Container(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Image.network(post.pages[index].image_data[index].thumb),
                          Text(post.pages[index].page_name),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.transparent,
             child: Container(
               height: 60.0,
               color: Colors.white,
               width: MediaQuery.of(context).size.width,
               padding: EdgeInsets.symmetric(horizontal: 100.0,vertical: 8.0),
               child: ElevatedButton(
                   onPressed: () {},
                 child: const Text('Create Now'),
           ),
             ),
          ),
        ],
      ),
    );
  }
}
