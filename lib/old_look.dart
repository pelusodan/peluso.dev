import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

void main() {
  runApp(Flutter95App());
}

class Flutter95Stateful extends StatefulWidget {
  final title;

  const Flutter95Stateful({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Flutter95State();
}

class IndexedWindow {
  int index;
  Widget widget;

  IndexedWindow(this.index, this.widget);
}

class _Flutter95State extends State<Flutter95Stateful> {
  List<int> windowIds = [0, 1, 2];

  Offset aboutPosition = Offset(100, 100);
  Offset contactMePosition = Offset(200, 200);
  double prevScale = 1;
  double scale = 1;

  void updateScale(double zoom) => setState(() => scale = prevScale * zoom);

  void commitScale() => setState(() => prevScale = scale);

  void updateAboutPosition(Offset newPosition) => setState(() {
        aboutPosition = newPosition;
        windowIds.remove(1);
        windowIds.add(1);
      });

  void updateContactPosition(Offset newPosition) => setState(() {
        contactMePosition = newPosition;
        windowIds.remove(2);
        windowIds.add(2);
      });

  var accepted = false;
  var verticalOffset = 77;

  Toolbar95 mainToolbar() {
    return Toolbar95(actions: [
      Item95(
        label: 'File',
        menu: _buildMenu(),
      ),
      Item95(
        label: 'Edit',
        onTap: (context) {},
      ),
      Item95(
        label: 'Save',
        onTap: (context) {},
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold95(
        title: 'Flutter95',
        toolbar: mainToolbar(),
        body: Container(
            width: screenWidth,
            height: screenHeight - verticalOffset,
            child: GestureDetector(
              onScaleUpdate: (details) => updateScale(details.scale),
              onScaleEnd: (_) => commitScale(),
              child: Stack(
                  children:
                      windowIds.map((e) => generateWidgetFromId(e)).toList()),
            )));
  }

  Menu95 _buildMenu() {
    return Menu95(
      items: [
        MenuItem95(
          value: 1,
          label: 'New',
        ),
        MenuItem95(
          value: 2,
          label: 'Open',
        ),
        MenuItem95(
          value: 3,
          label: 'Exit',
        ),
      ],
      onItemSelected: (item) {},
    );
  }

  Widget buildAbout() {
    return Draggable(
      maxSimultaneousDrags: 1,
      data: 'about_window',
      child: Transform.scale(
        scale: scale,
        child: buildAboutWindowContent(),
      ),
      feedback: buildAboutWindowContent(),
      childWhenDragging: Container(),
      onDragEnd: (details) => updateAboutPosition(details.offset),
    );
  }

  Widget buildContactMe() {
    return Draggable(
      maxSimultaneousDrags: 1,
      data: 'contact_window',
      child: Transform.scale(
        scale: scale,
        child: buildAboutWindowContent(),
      ),
      feedback: buildAboutWindowContent(),
      childWhenDragging: Container(),
      onDragEnd: (details) => updateContactPosition(details.offset),
    );
  }

  Widget buildAboutWindowContent() {
    return Elevation95(
        type: Elevation95Type.down,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: 500,
                height: 300,
                child: Scaffold95(
                  title: "About",
                  toolbar: Toolbar95(
                    actions: [
                      Item95(
                        label: 'socials',
                        menu: Menu95(
                            items: [
                              MenuItem95(value: 1, label: 'github'),
                              MenuItem95(value: 2, label: 'linkedin'),
                              MenuItem95(value: 3, label: 'twitter')
                            ],
                            onItemSelected: (item) {
                              //TODO
                            }),
                      )
                    ],
                  ),
                  body: Row(
                    children: [
                      Image.asset(
                        'img/header_dan.png',
                        width: 190,
                        height: 190,
                      ),
                      Text(
                        'mobile developer \nhardware engineer \nmusician',
                        style: Flutter95.textStyle,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget generateWidgetFromId(int e) {
    //TODO: give the correct window from the index
    if (e == 0) {
      return Positioned.fill(
          child: Container(
        color: Colors.blue,
      ));
    } else if (e == 1) {
      return Positioned(
        child: buildAbout(),
        left: aboutPosition.dx,
        top: aboutPosition.dy - verticalOffset,
      );
    } else if (e == 2) {
      return Positioned(
        child: buildContactMe(),
        left: contactMePosition.dx,
        top: contactMePosition.dy - verticalOffset,
      );
    } else {
      return Container();
    }
  }
}

class Flutter95App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Flutter95.background,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  var accepted = false;

  @override
  Widget build(BuildContext context) {
    var deepBlue = Color.fromARGB(255, 7, 19, 205);
    return Scaffold95(
        title: 'Flutter95',
        toolbar: Toolbar95(actions: [
          Item95(
            label: 'File',
            menu: _buildMenu(),
          ),
          Item95(
            label: 'Edit',
            onTap: (context) {},
          ),
          Item95(
            label: 'Save',
            onTap: (context) {},
          ),
        ]),
        body: Container(
          width: 800,
          height: 800,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                color: Colors.blue,
              )),
              buildAbout(),
            ],
          ),
        ));
  }

  Menu95 _buildMenu() {
    return Menu95(
      items: [
        MenuItem95(
          value: 1,
          label: 'New',
        ),
        MenuItem95(
          value: 2,
          label: 'Open',
        ),
        MenuItem95(
          value: 3,
          label: 'Exit',
        ),
      ],
      onItemSelected: (item) {},
    );
  }

  Widget buildAbout() {
    return Draggable(
      data: 'about_window',
      child: Elevation95(
          type: Elevation95Type.down,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  width: 500,
                  height: 300,
                  child: Scaffold95(
                    title: "About",
                    toolbar: Toolbar95(
                      actions: [
                        Item95(
                          label: 'socials',
                          menu: Menu95(
                              items: [
                                MenuItem95(value: 1, label: 'github'),
                                MenuItem95(value: 2, label: 'linkedin'),
                                MenuItem95(value: 3, label: 'twitter')
                              ],
                              onItemSelected: (item) {
                                //TODO
                              }),
                        )
                      ],
                    ),
                    body: Row(
                      children: [
                        Image.asset(
                          'img/header_dan.png',
                          width: 190,
                          height: 190,
                        ),
                        Text(
                          'mobile developer \nhardware engineer \nmusician',
                          style: Flutter95.textStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      feedback: Elevation95(
          type: Elevation95Type.down,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  width: 500,
                  height: 300,
                  child: Scaffold95(
                    title: "About",
                    toolbar: Toolbar95(
                      actions: [
                        Item95(
                          label: 'socials',
                          menu: Menu95(
                              items: [
                                MenuItem95(value: 1, label: 'github'),
                                MenuItem95(value: 2, label: 'linkedin'),
                                MenuItem95(value: 3, label: 'twitter')
                              ],
                              onItemSelected: (item) {
                                //TODO
                              }),
                        )
                      ],
                    ),
                    body: Row(
                      children: [
                        Image.asset(
                          'img/header_dan.png',
                          width: 190,
                          height: 190,
                        ),
                        Text(
                          'mobile developer \nhardware engineer \nmusician',
                          style: Flutter95.textStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      childWhenDragging: Container(),
    );
  }

  Widget buildDragTarget() {
    return DragTarget(
      builder: (context, List<String?> candidateData, rejectedData) {
        return accepted ? buildAbout() : Container();
      },
      onAccept: (data) {
        accepted = false;
      },
      onWillAccept: (data) {
        return true;
      },
      onMove: (data) {
        accepted = false;
      },
    );
  }
}

class ScreenThatCanPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: 'Screen that can pop',
      body: Container(),
    );
  }
}
