import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:taskretofitpicsy/network/model/datas.dart';
import 'network/apiservice/api_service.dart';
import 'network/model/responses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:_buildBody(context),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
FutureBuilder<Responses> _buildBody(BuildContext context) {
  final client = ApiService(dio.Dio()).fetchAlbum();
  return FutureBuilder<Responses>(
    future: client,
    builder: (context, snapshot) {
      try {
        if (snapshot.connectionState == ConnectionState.done) {
          //final List<Album> posts = snapshot.requireData;
          final List<Datas> posts = snapshot.data!.data;
          print(snapshot.data);
          if (snapshot.data!.status) {
            print('vivek ${snapshot.data!.status}');
            return _buildListView(context, posts);
          } else {
            print('vivek ${snapshot.data!.status}');
            return _buildListView(context, posts);
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
      on DioError catch (e) {
        String s = 'vivek';
        if (e.type == DioErrorType.response) {
          print('catched');
          s = 'catched';
        }
        if (e.type == DioErrorType.connectTimeout) {
          print('check your connection');
          s = 'catched';
        }
        if (e.type == DioErrorType.receiveTimeout) {
          print('unable to connect to the server');
          s = 'catched';
        }
        if (e.type == DioErrorType.other) {
          print('Something went wrong');
          s = 'catched';
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
Widget _buildListView(BuildContext context,List<Datas> posts) {
  return ListView.builder(itemBuilder: (context,index){
    return Card(
      margin: const EdgeInsets.all(12.0),
      clipBehavior: Clip.hardEdge,
      elevation: 10.0,
      shadowColor: Colors.black12,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _firstblock(posts,index),
            const Divider(),
            _secondBlock(posts,index),
          ],
        ),
      ),
    );
  },
    itemCount: posts.length,
  );

}

Widget _secondBlock(List<Datas> posts,int index) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(posts[index].yearbook_description.Price),
        ),
        Container(
          child: Row(
            children: [
              _button(Icons.remove_red_eye_outlined, 'Preview', Colors.grey.shade500),
              SizedBox(width: 2.0,),
              _button(Icons.border_color , 'Create', Color(0xFFec5872)),
            ],
          ),
        ),
      ],
    );

Widget _button(IconData pending, String title, Color grey) => TextButton.icon(

      onPressed: () {},
      icon: Icon(
        pending,
        color: Colors.white,
      ),
      label: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
        backgroundColor: grey,
        shape:RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
      ),
    );

Widget _firstblock(List<Datas> posts, int index) => Container(
      child: Row(
        children: [
          FittedBox(
            child: Image.network(
             posts[index].img_http_thumb,
              height: 100.0,
              width: 100.0,
            ),
            fit: BoxFit.fitWidth,
          ),
          _addtext(posts,index),
        ],
      ),
    );

Widget _addtext(List<Datas> posts,int index) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(posts[index].yearbook_name),
          Text(posts[index].yearbook_description.Desc),
          SizedBox(
            height: 5.0,
          ),
          Text('Pages: Min 20 - Max 80'),
          SizedBox(
            height: 5.0,
          ),
          Text('Est. Delivary 5-7 workijng days'),
        ],
      ),
    );
