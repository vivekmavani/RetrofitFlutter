import 'package:flutter/material.dart';
import 'package:taskretofitpicsy/network/model/datas.dart';

class DisplayItemScreen extends StatelessWidget {
  final Datas post;
  final int index;
  const DisplayItemScreen( {Key? key,required this.post,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(post.yearbook_name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
      ),
      body:  Column(
        children: [
          const Padding(padding: EdgeInsets.only(top:50)),
          Hero(
            tag: 'yearbookitem$index',
            child: Image.network(
              post.img_http_thumb,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top:50)),
          Text(post.yearbook_description.Desc,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );


  }
}