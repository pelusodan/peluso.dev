import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pelusodan_dev/old_look.dart';
import 'package:pelusodan_dev/utils.dart';

void main() {
  runApp(const MyApp());
}

class DraggableScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: DraggableScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'peluso.dev',
      theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlue),
      //home: const MyHomePage(title: 'peluso.dev'),
      home: const Flutter95Stateful(
        title: "Flutter95",
      ),
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
    var deepBlue = const Color.fromARGB(255, 0, 20, 199);
    var vapePurple = const Color.fromARGB(255, 185, 103, 255);
    var vapeYellow = const Color.fromARGB(255, 255, 251, 150);

    return Scaffold(
      backgroundColor: deepBlue,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: vapePurple,
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
                          openLink(
                              'open', ['https://github.com/pelusodan']);
                        },
                        icon: FaIcon(FontAwesomeIcons.github,
                            color: vapeYellow, size: screenWidth / 20),
                      ),
                      SizedBox(
                        width: screenWidth / 40,
                      ),
                      IconButton(
                        constraints: BoxConstraints(
                            minHeight: screenWidth / 20,
                            minWidth: screenWidth / 20),
                        onPressed: () {
                          /*Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Flutter95App()));*/
                        },
                        icon: FaIcon(FontAwesomeIcons.linkedin,
                            color: vapeYellow, size: screenWidth / 20),
                      ),
                      SizedBox(
                        width: screenWidth / 40,
                      ),
                      IconButton(
                        constraints: BoxConstraints(
                            minHeight: screenWidth / 20,
                            minWidth: screenWidth / 20),
                        onPressed: () {
                          //TODO: launch a new page for other concepts
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewConceptScreen()));
                        },
                        icon: FaIcon(FontAwesomeIcons.conciergeBell,
                            color: vapeYellow, size: screenWidth / 20),
                      ),
                    ],
                  )),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: DefaultTextStyle(
                style: TextStyle(
                  color: vapeYellow,
                  fontSize: screenHeight / 8,
                  fontFamily: 'Blockstepped',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('peluso.dev',
                        speed: const Duration(milliseconds: 300)),
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
                  color: index.isOdd ? vapePurple : vapeYellow,
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

class NewConceptScreen extends StatefulWidget {
  const NewConceptScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewConceptScreenState();
}

class _NewConceptScreenState extends State<NewConceptScreen> {
  int selectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    var style = TextStyle(color: Colors.white, fontSize: screenHeight / 12);

    return Material(
      type: MaterialType.transparency,
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: getImageFromSelection(selectionIndex)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight / 20,
              ),
              Text(
                'peluso.dev',
                style:
                    TextStyle(color: Colors.white, fontSize: screenHeight / 6),
              ),
              SizedBox(
                width: screenWidth,
                height: screenHeight / 3,
                child: ListWheelScrollView(
                    onSelectedItemChanged: (index) {
                      print("index is " + index.toString());
                      setBackground(index);
                    },
                    physics: FixedExtentScrollPhysics(),
                    itemExtent: 100,
                    perspective: .01,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "front end developer",
                            style: style,
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "hardware engineer",
                            style: style,
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "adventurer",
                            style: style,
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "indie rocker",
                            style: style,
                          )),
                    ]),
              )
            ],
          )),
    );
  }

  ExactAssetImage getImageFromSelection(int selectionIndex) {
    var image = const ExactAssetImage('img/camp_dark.jpg');
    switch (selectionIndex) {
      case 0:
        {
          image = const ExactAssetImage('img/camp_dark.jpg');
        }
        break;
      case 1:
        {
          image = const ExactAssetImage('img/water_arches.jpg');
        }
        break;
      case 2:
        {
          image = const ExactAssetImage('img/narrows.jpg');
        }
        break;
      case 3:
        {
          image = const ExactAssetImage('img/cv.jpg');
        }
        break;
    }
    return image;
  }

  void setBackground(int index) {
    setState(() {
      selectionIndex = index;
    });
  }
}
