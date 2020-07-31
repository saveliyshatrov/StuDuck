import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
//import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

void goToPageTwo(String text, BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => PageTwo(title: text,)),
  );
}

  Widget createElemSecondaryList(Color elementColor, Icon elementIcon, String text, BuildContext context) {
    return InkWell(
      onTap: () {
        goToPageTwo(text, context);
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: elementColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Align(
          alignment: Alignment(0, 0),
          child: elementIcon,
        ),
      )
    );
  }

Widget createElemThirdPartyList(String text) {
  return Container(
    child: Align(
      alignment: Alignment(0, 0),
      child: Text(text, style: TextStyle(
      fontSize: 30,
    ),),),
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ));
}

//'https://images.unsplash.com/photo-1542204637-e67bc7d41e48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80'
Widget createElemMainList(Color colorElement, String url) {
  return Container(
    width: 170,
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(url),
        fit: BoxFit.cover,
      ),
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Align(
      alignment: Alignment(-.65, .6),
      child: Text(
        "",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
    /*child: Image.network(
      "https://images.unsplash.com/photo-1542204637-e67bc7d41e48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80",
      fit: BoxFit.cover,
      width: double.maxFinite,
      height: double.maxFinite,
    )*/
  );
}

Widget createAppBar(String appBarText) {
  return AppBar(
    brightness: Brightness.dark,
    leading: Icon(Icons.menu),
    centerTitle: true,
    title: Text(
      appBarText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w300,
      ),
    ),
    backgroundColor: Color.fromRGBO(9, 32, 63, 1), //#09203F
    elevation: 0.0,
    flexibleSpace: Container(
      child: ClipRRect(
        // make sure we apply clip it properly
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'StuDuck'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(widget.title),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment
              .bottomCenter, // 10% of the width, so there are ten blinds.
          colors: [
            Color.fromRGBO(9, 32, 63, 1),
            Color.fromRGBO(83, 120, 149, 1)
          ], // whitish to gray
        )),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  createElemMainList(Colors.green,
                      'https://images.unsplash.com/photo-1542204637-e67bc7d41e48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80'),
                  createElemMainList(Colors.orange,
                      'https://images.unsplash.com/photo-1520828954822-4aa221e867aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80'),
                  createElemMainList(Colors.blue,
                      'https://images.unsplash.com/photo-1560354508-468e7201bbc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2094&q=80'),
                ],
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  createElemSecondaryList(
                      Colors.redAccent,
                      Icon(Icons.fastfood, color: Colors.white, size: 45),
                      "По-есть", context),
                  createElemSecondaryList(
                      Colors.blueAccent,
                      Icon(Icons.local_movies, color: Colors.white, size: 45),
                      "По-смотреть", context),
                  createElemSecondaryList(
                      Colors.lightGreen,
                      Icon(Icons.nature_people, color: Colors.white, size: 45),
                      "По-гулять", context),
                  createElemSecondaryList(
                      Colors.black,
                      Icon(Icons.games, color: Colors.white, size: 45),
                      "По-играть", context),
                ],
              ),
            ),
            createElemThirdPartyList("1"),
            createElemThirdPartyList("2"),
            createElemThirdPartyList("3"),
            createElemThirdPartyList("4"),
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  PageTwo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(widget.title),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment
              .bottomCenter, // 10% of the width, so there are ten blinds.
          colors: [
            Color.fromRGBO(9, 32, 63, 1),
            Color.fromRGBO(83, 120, 149, 1)
          ], // whitish to gray
        )
        ),
        child: ListView(
          children: [
            createElemThirdPartyList(widget.title),
            createElemThirdPartyList(widget.title),
            createElemThirdPartyList(widget.title),
            createElemThirdPartyList(widget.title),
            createElemThirdPartyList(widget.title),
            createElemThirdPartyList(widget.title),
            createElemThirdPartyList(widget.title),
            createElemThirdPartyList(widget.title),
          ],
        ),
        ),
    );
  }
}
