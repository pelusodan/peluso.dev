import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

void main() {
  runApp(Flutter95App());
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
              Card(
                color: Colors.blueAccent,
                child: buildDragTarget(),
              ),
              buildAbout(),
            ],
          ),
        ));
  }

  /**/

  /*
  * Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
      ),
  * */

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

  /// Build a ListView wrapping it in [Elevation95] with [Elevation95Type.down].
  /// This will create a "deep" container.
  /// Then wrap each item with [Elevation95Type.up] to create an up effect.
  Padding _buildListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: Elevation95(
        type: Elevation95Type.down,
        child: SizedBox(
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Elevation95(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Item $index',
                    style: Flutter95.textStyle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
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
        accepted = true;
      },
      onWillAccept: (data) {
        return true;
      },
      onLeave: (data){
        accepted =  false;
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
