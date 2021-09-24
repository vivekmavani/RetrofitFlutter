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
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
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
                  const SizedBox(
                    height: 12.0,
                  ),
                  _getimage(post.pages[0].image_data[0].thumb,post.pages[0].page_name,context,0,post.pages[0].page_index),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GridView.count(crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    children: List.generate(post.pages.length, (index) =>
                        _getimage(post.pages[index].image_data[0].thumb,post.pages[index].page_name,context,1,index,post.pages.length),
                       // Image.network(post.pages[index].image_data[0].thumb,fit: BoxFit.fitWidth,),
                    ),
                  ),
                  _getimage(post.pages[post.pages.length-1].image_data[0].thumb,post.pages[post.pages.length-1].page_name,context,0,post.pages[0].page_index),
                  const SizedBox(
                    height: 60.0,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0.0,
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
        /*  Container(
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
          ),*/
        ],
      ),
    );
  }
}
Widget _getimage(String thumb,String title,BuildContext context, int i, int page_index, [int? length]) =>
    i== 1 ?  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    0 == page_index || length!-1 == page_index ? Container(color: Colors.grey.shade700,height: MediaQuery.of(context).size.height / 6,width: MediaQuery.of(context).size.width / 2) :
    Image.network(thumb, height: MediaQuery.of(context).size.height / 6,width: MediaQuery.of(context).size.width / 2,fit: BoxFit.cover,),
   Visibility(
     visible:  page_index.isEven ? true : false,
            child:  page_index == 0  ? Texts(title: 'Page ${page_index + 1}', color: Colors.grey.shade700,)
                : page_index == length!-2 ? Texts(title: 'Page ${page_index}', color: Colors.grey.shade700,)
                : Texts(title: 'Page ${page_index}-${page_index + 1}', color: Colors.grey.shade700,),
   ),
  ],
) :  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(thumb, height: MediaQuery.of(context).size.height / 6,width: MediaQuery.of(context).size.width / 2,fit: BoxFit.cover,),
         Texts(title: title, color: Colors.grey.shade700,),
      ],
    );
