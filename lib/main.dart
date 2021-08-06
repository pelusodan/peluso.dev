import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'peluso.dev',
      theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlue),
      home: const MyHomePage(title: 'peluso.dev'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//TODO: extract some of this logic so it isn't all on one page
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    var deepBlue = Color.fromARGB(255, 0, 20, 199);

    return Scaffold(
      backgroundColor: deepBlue,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: deepBlue,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: screenHeight / 4,
            collapsedHeight: screenHeight / 6,
            toolbarHeight: screenHeight / 6,
            actions: [
              Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth / 16, bottom: screenHeight / 20),
                  child: Row(
                    children: [
                      IconButton(
                          constraints: BoxConstraints(
                              minHeight: screenWidth / 20,
                              minWidth: screenWidth / 20),
                          onPressed: () {
                            js.context.callMethod(
                                'open', ['https://github.com/pelusodan']);
                          },
                          icon: FaIcon(FontAwesomeIcons.github,
                              color: Colors.white, size: screenWidth / 20)),
                      SizedBox(
                        width: screenWidth / 40,
                      ),
                      IconButton(
                          constraints: BoxConstraints(
                              minHeight: screenWidth / 20,
                              minWidth: screenWidth / 20),
                          onPressed: () {
                            js.context.callMethod('open',
                                ['https://www.linkedin.com/in/pelusodan/']);
                          },
                          icon: FaIcon(FontAwesomeIcons.linkedin,
                              color: Colors.white, size: screenWidth / 20)),
                    ],
                  )),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight / 8,
                  fontFamily: 'Blockstepped',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('peluso.dev',
                        speed: Duration(milliseconds: 300)),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : deepBlue,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
