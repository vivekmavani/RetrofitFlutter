import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskretofitpicsy/network/apiservice/api_service.dart';
import 'package:taskretofitpicsy/network/model/bookresponses.dart';
import 'package:taskretofitpicsy/network/model/datas.dart';
import 'package:dio/dio.dart' as dio;
import 'package:taskretofitpicsy/cubi.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    BlocProvider.of<YearbookCubit>(context).fetchyearbook();

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: BlocBuilder<YearbookCubit, YearbookState>(
  builder: (context, state) {
    if(!(state is YearbookLoading))
      return Center(child: CircularProgressIndicator());
    final posts  = (state as YearbookLoading).bookResponses;

    return _buildListView(context, posts.response!.data);
  },
),
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}

/*FutureBuilder<BookResponses> _buildBody(BuildContext context) {
  final client = ApiService(dio.Dio(), 'http://www.demoaws.picsy.in/api');
  return FutureBuilder<BookResponses>(
    future: client.fetchAlbum(),
    builder: (context, snapshot) {
      try {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot);
          if(snapshot.data != null)
          {
            final List<Datas> posts = snapshot.data!.response!.data;
            return _buildListView(context, posts);
          }else
          {
            return const Center(
              child: Text('Data is null'),
            );
          }

        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      } on DioError catch (e) {
        if (e.type == DioErrorType.response) {
          print('catched');
        }
        if (e.type == DioErrorType.connectTimeout) {
          print('check your connection');
        }
        if (e.type == DioErrorType.receiveTimeout) {
          print('unable to connect to the server');
        }
        if (e.type == DioErrorType.other) {
          print('Something went wrong');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}*/


Widget _buildListView(BuildContext context, List<Datas> posts) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  DisplayItemScreen(post :posts[index],index: index);
          }));
        },
        child: Card(
          margin: const EdgeInsets.all(12.0),
          clipBehavior: Clip.hardEdge,
          elevation: 10.0,
          shadowColor: Colors.black12,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: _firstblock(posts, index),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: _secondBlock(posts, index),
              ),
            ],
          ),
        ),
      );
    },
    itemCount: 10,
  );
}

Widget _secondBlock(List<Datas> posts, int index) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
      padding: const EdgeInsets.only(left: 6.0),
      child: Text(
        posts[index].yearbook_description.Price,
        style:
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87,fontSize:18.0),
      ),
    ),
    Container(
      padding: const EdgeInsets.only(right: 6.0),
      child: Row(
        children: [
          _button(Icons.remove_red_eye_outlined, 'Preview',
              Colors.grey.shade700),
          const SizedBox(
            width: 10.0,
          ),
          _button(Icons.create, 'Create', Color(0xFFec5872)),
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
  label: Text(
    title,
    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  style: TextButton.styleFrom(
    textStyle: const TextStyle(fontSize: 12),
    backgroundColor: grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.0),
    ),
  ),
);

Widget _firstblock(List<Datas> posts, int index) => Container(
  child: Row(
    children: [
      Hero(
        tag: 'yearbookitem$index',
        child: Image.network(
          posts[index].img_http_thumb,
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(
        width: 10.0,
      ),
      _addtext(posts, index),
    ],
  ),
);
Widget _addtext(List<Datas> posts, int index) => Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Texts(
        title :posts[index].yearbook_name,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),

      const SizedBox(
        height: 5.0,
      ),

      Text(posts[index].yearbook_description.Desc),
      const SizedBox(
        height: 5.0,
      ),
      Row(
        children: const [
          Text(
            'Pages: ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          Text(
            'Min 20 - Max 80',
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),
      Row(
        children: const [
          Text(
            'Est. Delivary ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          Text(
            '5-7 working days',
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    ],
  ),
);

