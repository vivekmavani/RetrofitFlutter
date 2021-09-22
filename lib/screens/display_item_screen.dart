import 'package:flutter/material.dart';
import 'package:taskretofitpicsy/network/model/datas.dart';

class DisplayItemScreen extends StatelessWidget {
  final Datas post;
  final int index;
  const DisplayItemScreen( {Key? key,required this.post,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'yearbookitem$index',
            child: Image.network(
              post.img_http_thumb,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            post.yearbook_name,
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black87,),
              textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(post.yearbook_description.Desc,textAlign: TextAlign.center,),
        ],
      ),
    );


  }
}