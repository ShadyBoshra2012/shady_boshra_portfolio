import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:flutter_web_ui/ui.dart' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shady Boshra Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory(
        'hello-world-html',
        (int viewId) =>
            IFrameElement()..src = 'https://www.youtube.com/embed/tgbNymZ7vqY');

    return Scaffold(
        body: Stack(children: <Widget>[
      // Background container
      Container(
          constraints: BoxConstraints(
              minWidth: double.infinity, minHeight: double.infinity),
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: NetworkImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          )),
      // Route content container
      SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0x40000000),
          child: Center(
              child: Card(
                  color: Color(0xAAFFFFFF),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          width: 800,
                          height: 600,
                          child: SingleChildScrollView(
                              child: Column(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image(
                                        width: 200,
                                        height: 200,
                                        image: NetworkImage(
                                            "assets/images/shady_boshra.jpg")))),
                            Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 5),
                                child: Text(
                                  "Shady Boshra",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 20),
                                child: Text(
                                  "Android & Flutter Developer",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 28),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Here's I am, senior student and seek to be a good developer. I have developed apps that are live now. I hope to develop more and more. The applications that I develop or help in, it should be effective and give benefits to everyone. I welcome any message from you. ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0x60003f3f),
                                        border: Border(
                                            left: BorderSide(
                                          color: Color(0xAA003f3f),
                                          width: 6.0,
                                        ))))),
                            Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 5),
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: <Widget>[
                                        /*HtmlView(
                                            viewType:
                                                '<i class="fa fa-star"></i>'),*/
                                        HtmlView(
                                          viewType: 'hello-world-html',
                                        )
                                      ],
                                    ))),
                          ])))))),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: Text(
            "Here I am",
            style: TextStyle(color: Colors.black),
          )),
        ),
      ]))
    ]));
  }
}
