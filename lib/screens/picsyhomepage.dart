import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskretofitpicsy/custom_widget/custom_texts.dart';
import 'package:taskretofitpicsy/screens/photobooks.dart';

import '../cubi.dart';

class Picsyhomepage extends StatelessWidget {
  const Picsyhomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/appicon.png")),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Image.network(
                "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152637_8098.png",
                height: 30,
                width: 30,
              ),
              title: Text("My Gifts"),
              trailing: Icon(Icons.new_releases, color: Color(0xFFec5872)),
            ),
            ListTile(
              leading: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152624_79307.png",
                  height: 30,
                  width: 30),
              title: Text("More Designs"),
            ),
            ListTile(
              leading: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152656_47415.png",
                  height: 30,
                  width: 30),
              title: const Text("Previous Orders"),
            ),
            ListTile(
              leading: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152724_1190.png",
                  height: 30,
                  width: 30),
              title: const Text("New Albums"),
              trailing: const Icon(Icons.new_releases, color: Colors.redAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (BuildContext context) => YearbookCubit(),
                      child: const MyHomePage(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152712_80995.png",
                  height: 30,
                  width: 30),
              title: const Text("Earn Rewards"),
              trailing: const Icon(Icons.monetization_on_outlined,
                  color: Colors.green),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                children: const [
                  Divider(
                    height: 4,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Log Out"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Color(0xFFec5872)),
        backgroundColor: Colors.white,
        actions: [
          const Icon(Icons.notifications_none_outlined),
          Padding(
            padding: EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Chat'),
            ),
          ),
          const Icon(Icons.more_vert),
        ],
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Image.asset(
          'assets/appicon.png',
          fit: BoxFit.fitHeight,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: _BottomNavigationBar(),
      body: Body(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: _imageiconbottomnav(
                'https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152637_8098.png'),
            label: 'Gift Card'),
        BottomNavigationBarItem(
            icon: _imageiconbottomnav(
                'https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152624_79307.png'),
            label: 'My Designs'),
        BottomNavigationBarItem(
            icon: _imageiconbottomnav(
              'https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152656_47415.png',
            ),
            label: 'My Orders'),
        BottomNavigationBarItem(
            icon: _imageiconbottomnav(
              'https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152724_1190.png',
            ),
            label: 'Shared Albums'),
        BottomNavigationBarItem(
          icon: _imageiconbottomnav(
            'https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152712_80995.png',
          ),
          label: 'Earn rewards',
        ),
      ],
      fixedColor: Colors.black87,
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(
        color: Colors.black87,
        fontSize: 12,
      ),
      selectedLabelStyle: const TextStyle(
        color: Colors.black87,
        fontSize: 12,
      ),
      unselectedItemColor: Colors.black87,
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Image.network(
                'https://www.picsy.in/images/app/New-Dashboard/share-album.jpg',
              ),
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  cards(
                      'https://www.picsy.in/images/app/New-App/dashboard/Photobook.jpg',
                      'Photo Books',
                      'Convert photos to printed photo books',
                      '₹499'),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        first(
                            'https://www.picsy.in/images/app/New-App/dashboard/Calendar.jpg',
                            'Photo Calender',
                            '₹500',
                            context),
                        first(
                            'https://www.picsy.in/images/app/New-App/dashboard/Photoprint.jpg',
                            'Canvas Prints',
                            '₹160',
                            context),
                      ],
                    ),
                  ),
                  cards(
                      'https://www.picsy.in/images/app/New-App/dashboard/Canvas.jpg',
                      'Photo Books',
                      'Photos on Canvas for walls',
                      '₹999'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget cards(String image, String title, String subtitle, String rs) {
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(12.0),
      ),
    ),
    margin: const EdgeInsets.only(top: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          image,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Texts(
                  title: title,
                  fontsize: 18.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Texts(
                title: 'From ',
                fontsize: 16.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              Texts(
                title: rs,
                fontsize: 16.0,
                color: const Color(0xFFec5872),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
          child: Texts(
            title: subtitle,
            fontsize: 16.0,
            color: const Color(0xFFec5872),
          ),
        ),
      ],
    ),
  );
}

Widget first(String image, String title, String rs, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 2 - 24,
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 1.0),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
            child: Row(
              children: [
                Texts(
                  title: 'From ',
                  fontsize: 16.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                Texts(
                  title: rs,
                  fontsize: 16.0,
                  // color: Colors.pink,#ec5872
                  color: Color(0xFFec5872),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _imageiconbottomnav(String image) => Image.network(
      image,
      height: 25,
      width: 25,
    );
