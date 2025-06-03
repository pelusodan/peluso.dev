import 'dart:js' as js;

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:pelusodan_dev/email_utils.dart';
import 'package:pelusodan_dev/presentations.dart';
import 'package:pelusodan_dev/project.dart';
import 'package:pelusodan_dev/resume.dart';
import 'package:pelusodan_dev/scale_route.dart';
import 'package:pelusodan_dev/tech.dart';
import 'package:pelusodan_dev/windows_dialog.dart';
import 'package:timelines_plus/timelines_plus.dart';

import 'album.dart';

void main() {
  //runApp(Flutter95App());
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
  /**
   * This keeps track of the windows on our screen
   */
  List<int> windowIds = [0, 70, 69, 1, 99, 2, 8, 30, 20];

  Offset aboutPosition = Offset(100, 100);
  Offset projectPosition = Offset(0, 300);
  Offset daffyPosition = Offset(300, 100);
  Offset musicPosition = Offset(-150, 800);
  Offset techPosition = Offset(999, 100);
  Offset presentationPosition = Offset(500, 200);
  double prevScale = 1;
  double scale = 1;

  // TODO make the window class more generic so we can better add them
  String? currentEmail;

  String? currentMessage;

  String? currentName;

  var musicCurrentPage = 0;
  var projectCurrentPage = 0;
  var presentationCurrentPage = 0;
  var daffyEnabled = false;

  void updateScale(double zoom) => setState(() => scale = prevScale * zoom);

  void commitScale() => setState(() => prevScale = scale);

  void setAlbumSlidePage(int selection) =>
      setState(() => musicCurrentPage = selection);

  void setProjectSlidePage(int selection) =>
      setState(() => projectCurrentPage = selection);

  void setPresentationSlidePage(int selection) =>
      setState(() => presentationCurrentPage = selection);

  void updateAboutPosition(Offset newPosition) => setState(() {
        aboutPosition = newPosition;
        windowIds.remove(1);
        windowIds.add(1);
      });

  void updateTimelinePosition() => setState(() {
        windowIds.remove(2);
        windowIds.add(2);
      });

  void updateProjectPosition(Offset newPosition) => setState(() {
        projectPosition = newPosition;
        windowIds.remove(70);
        windowIds.add(70);
      });

  void updatePresentationPosition(Offset newPosition) => setState(() {
        presentationPosition = newPosition;
        windowIds.remove(8);
        windowIds.add(8);
      });

  void updateDaffyPosition(Offset newPosition) => setState(() {
        daffyPosition = newPosition;
        windowIds.remove(20);
        windowIds.add(20);
      });

  void updateStaticContactPosition() => setState(() {
        windowIds.remove(99);
        windowIds.add(99);
      });

  void updateMusicPosition(Offset offset) => setState(() {
        musicPosition = offset;
        windowIds.remove(69);
        windowIds.add(69);
      });

  updateTechPosition(Offset offset) => setState(() {
        techPosition = offset;
        windowIds.remove(30);
        windowIds.add(30);
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
        label: 'Resume',
        onTap: (context) {
          Navigator.of(context).push(scaleBuilder());
        },
      ),
      Item95(
        label: 'FridgePal',
        onTap: (context) {
          js.context.callMethod(
              'open', ['https://www.pelusodan.com/flutter/fridgepal/#/']);
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      type: MaterialType.transparency,
      child: Scaffold95(
          title: 'peluso.dev',
          toolbar: mainToolbar(),
          body: screenWidth <
                  600 // check if we should render mobile version of site
              ? buildMobilePage(screenWidth, screenHeight) // mobile version
              : buildDesktopPage(screenWidth, screenHeight) // desktop version
          ),
    );
  }

  Menu95 _buildMenu() {
    return Menu95(
      items: [
        MenuItem95(
          value: 1,
          label: 'Old Website',
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
      onItemSelected: (item) {
        if (item == 1) {
          js.context.callMethod('open', ['https://pelusodan.com']);
        } else if (item == 2) {
          onUrlTapped('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
        } else if (item == 3) {
          setState(() => {daffyEnabled = !daffyEnabled});
        }
      },
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
      feedback: Material(
        type: MaterialType.transparency,
        child: Transform.scale(
          scale: scale,
          child: buildAboutWindowContent(),
        ),
      ),
      childWhenDragging: Container(),
      onDragEnd: (details) => updateAboutPosition(details.offset),
    );
  }

  Widget buildTech() {
    return Draggable(
      maxSimultaneousDrags: 1,
      data: 'tech_window',
      child: Transform.scale(
        scale: scale,
        child: buildTechContent(),
      ),
      feedback: Material(
        type: MaterialType.transparency,
        child: Transform.scale(
          scale: scale,
          child: buildTechContent(),
        ),
      ),
      childWhenDragging: Container(),
      onDragEnd: (details) => updateTechPosition(details.offset),
    );
  }

  Widget buildDaffy() {
    return Draggable(
      maxSimultaneousDrags: 1,
      data: 'daffy_window',
      child: Transform.scale(
        scale: scale,
        child: buildDaffyContent(),
      ),
      feedback: buildDaffyContent(),
      childWhenDragging: Container(),
      onDragEnd: (details) => updateDaffyPosition(details.offset),
    );
  }

  Widget buildTimeline() {
    return GestureDetector(
      child: buildTimelineContent(isVertical: false),
      onTap: () {
        updateTimelinePosition();
      },
    );
  }

  Widget buildProject() {
    return Draggable(
      maxSimultaneousDrags: 1,
      data: 'project_window',
      child: Transform.scale(
        scale: scale,
        child: buildProjectContent(),
      ),
      feedback: Material(
        type: MaterialType.transparency,
        child: Transform.scale(
          scale: scale,
          child: buildProjectContent(),
        ),
      ),
      childWhenDragging: Container(),
      onDragEnd: (details) => updateProjectPosition(details.offset),
    );
  }

  Widget buildPresentations() {
    return Draggable(
      maxSimultaneousDrags: 1,
      data: 'presentations_window',
      child: Transform.scale(
        scale: scale,
        child: buildPresentationContent(),
      ),
      feedback: Material(
        type: MaterialType.transparency,
        child: Transform.scale(
          scale: scale,
          child: buildPresentationContent(),
        ),
      ),
      childWhenDragging: Container(),
      onDragEnd: (details) => updatePresentationPosition(details.offset),
    );
  }

  Widget buildMusic() {
    return Draggable(
      maxSimultaneousDrags: 1,
      data: 'music_window',
      child: Transform.scale(
        scale: scale,
        child: buildMusicContent(),
      ),
      feedback: Material(
        type: MaterialType.transparency,
        child: Transform.scale(
          scale: scale,
          child: buildMusicContent(),
        ),
      ),
      childWhenDragging: Container(),
      onDragEnd: (details) => updateMusicPosition(details.offset),
    );
  }

  Widget buildAboutWindowContent({double width = 350, double height = 300}) {
    return Elevation95(
        type: Elevation95Type.down,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                height: height,
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
                            ],
                            onItemSelected: (item) {
                              switch (item) {
                                case 1:
                                  {
                                    js.context.callMethod('open',
                                        ['https://github.com/pelusodan']);
                                  }
                                  break;
                                case 2:
                                  {
                                    js.context.callMethod('open', [
                                      'https://www.linkedin.com/in/pelusodan/'
                                    ]);
                                  }
                                  break;
                              }
                            }),
                      )
                    ],
                  ),
                  body: Row(
                    children: [
                      Image.asset(
                        'assets/img/old_school_profile.jpg',
                        width: 190,
                        height: 190,
                      ),
                      Text(
                        'frontend developer \npublic speaker \nsongwriter',
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

  Widget buildTechContent({double width = 300, double height = 460}) {
    return Elevation95(
        type: Elevation95Type.down,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                child: Scaffold95(
                    title: "Toolbox",
                    body: Padding(
                      padding: EdgeInsets.all(2),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          TextStyle style = index == 0
                              ? Flutter95.headerTextStyle.copyWith(
                                  color: Flutter95.headerDark, fontSize: 22)
                              : Flutter95.textStyle.copyWith(fontSize: 14);
                          return Container(
                              color: (index % 2 == 0)
                                  ? Flutter95.grays[1]
                                  : Flutter95.grays[0],
                              child: Padding(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      techMap.keys.elementAt(index),
                                      style: style,
                                    )),
                                    Text(
                                      techMap.values.elementAt(index),
                                      style: style,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(3),
                              ));
                        },
                        itemCount: techMap.length,
                      ),
                    )),
              )
            ],
          ),
        ));
  }

  Widget buildDaffyContent({double width = 300, double height = 250}) {
    return Elevation95(
        type: Elevation95Type.down,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                child: Scaffold95(
                    title: "Fat Daffy in Brighton, UT",
                    body: Expanded(
                        child: Center(
                      child: Image.asset('assets/img/daffy.gif'),
                    ))),
              )
            ],
          ),
        ));
  }

  Widget buildContactMeContent({double width = 500, double height = 500}) {
    return GestureDetector(
      child: Elevation95(
          type: Elevation95Type.down,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                    width: width,
                    height: height,
                    child: Scaffold95(
                      title: "Contact Me",
                      body: buildContactMeForm(height: height),
                    )),
              ],
            ),
          )),
      onTap: () {
        updateStaticContactPosition();
      },
    );
  }

  Widget generateWidgetFromId(int e, BuildContext context) {
    if (e == 0) {
      return Positioned.fill(
          child: Container(
        color: Flutter95.secondary,
      ));
    } else if (e == 1) {
      return Positioned(
        child: buildAbout(),
        left: aboutPosition.dx,
        top: aboutPosition.dy - verticalOffset,
      );
    } else if (e == 2) {
      return Positioned(
        child: buildTimeline(),
        left: 20,
        bottom: 20,
      );
    } else if (e == 69) {
      return Positioned(
        child: buildMusic(),
        left: musicPosition.dx,
        top: musicPosition.dy - verticalOffset,
      );
    } else if (e == 30) {
      return Positioned(
        child: buildTech(),
        left: techPosition.dx,
        top: techPosition.dy - verticalOffset,
      );
    } else if (e == 70) {
      return Positioned(
        child: buildProject(),
        left: projectPosition.dx,
        top: projectPosition.dy - verticalOffset,
      );
    } else if (e == 99) {
      //This serves as the contact form which cannot move
      return Positioned(
        child: buildContactMeContent(),
        bottom: 50,
        right: 20,
      );
    } else if (e == 8) {
      return Positioned(
        child: buildPresentations(),
        left: presentationPosition.dx,
        top: presentationPosition.dy - verticalOffset,
      );
    } else if (e == 20 && daffyEnabled) {
      return Positioned(
        child: buildDaffy(),
        left: daffyPosition.dx,
        top: daffyPosition.dy - verticalOffset,
      );
    } else {
      return Container();
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final subjectController = TextEditingController();

  Widget buildContactMeForm({required double height}) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        height: height - 100,
        child: ListView(children: [
          Row(
            children: [
              Text("name",
                  style: Flutter95.textStyle
                      .copyWith(fontWeight: FontWeight.bold)),
              Expanded(
                  child: Container(
                child: TextField95(
                  controller: nameController,
                ),
                margin: const EdgeInsets.all(10),
              )),
            ],
          ),
          Row(
            children: [
              Text("email",
                  style: Flutter95.textStyle
                      .copyWith(fontWeight: FontWeight.bold)),
              Expanded(
                  child: Container(
                child: TextField95(
                  controller: emailController,
                ),
                margin: const EdgeInsets.all(10),
              )),
            ],
          ),
          Row(
            children: [
              Text("subject",
                  style: Flutter95.textStyle
                      .copyWith(fontWeight: FontWeight.bold)),
              Expanded(
                  child: Container(
                child: TextField95(
                  controller: subjectController,
                ),
                margin: const EdgeInsets.all(10),
              )),
            ],
          ),
          Row(
            children: [
              Text("message",
                  style: Flutter95.textStyle
                      .copyWith(fontWeight: FontWeight.bold)),
              Expanded(
                  child: Container(
                child: TextField95(
                  height: 100,
                  maxLines: 5,
                  multiline: true,
                  controller: messageController,
                ),
                margin: const EdgeInsets.all(10),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Button95(
              onTap: () async {
                // first check for field formatting
                if (EmailValidator.validate(emailController.value.text)) {
                  // show 'sent!' snackbar
                  final response = await sendEmail(
                    name: nameController.value.text,
                    email: emailController.value.text,
                    message: messageController.value.text,
                    subject: subjectController.value.text,
                  );
                  if (response == 200) {
                    showSuccessDialog95(
                        context: context,
                        title: "Message Sent",
                        message: "Expect a response soon!");
                    nameController.clear();
                    emailController.clear();
                    messageController.clear();
                    subjectController.clear();
                  } else {
                    showDialog95(
                        context: context,
                        title: "Server Error",
                        message: "Please try again later");
                  }
                } else {
                  // show 'cannot send' snackbar
                  showDialog95(
                      context: context,
                      title: "Error",
                      message: "Please enter valid email");
                }
              },
              child: Text(
                'submit',
                style: Flutter95.textStyle,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildTimelineContent({
    required bool isVertical,
    double width = 1600,
    double height = 430,
  }) {
    return SingleChildScrollView(
      // Wrap the entire content with SingleChildScrollView
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Constrain the child width to prevent unnecessary overflow
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width),
            child: Elevation95(
              type: Elevation95Type.down,
              child: Container(
                height: height,
                child: Scaffold95(
                  title: "Career",
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: width,
                        maxWidth: width,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: FixedTimeline.tileBuilder(
                                builder: TimelineTileBuilder.connectedFromStyle(
                                  contentsAlign: ContentsAlign.alternating,
                                  oppositeContentsBuilder: (context, index) =>
                                      Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          getTimelineTextTitleFromIndex(index),
                                          textAlign: TextAlign.center,
                                          style: Flutter95.headerTextStyle
                                              .copyWith(
                                            color: Flutter95.headerDark,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          getTimelineTextFromIndex(index),
                                          textAlign: TextAlign.left,
                                          style: Flutter95.textStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  contentsBuilder: (context, index) =>
                                      Image.asset(
                                    getImagePathFromTimelineIndex(index),
                                    height: 150,
                                    width: 150,
                                  ),
                                  connectorStyleBuilder: (context, index) =>
                                      ConnectorStyle.solidLine,
                                  indicatorStyleBuilder: (context, index) =>
                                      IndicatorStyle.dot,
                                  itemCount: 5,
                                ),
                                theme: TimelineThemeData(
                                  color: Flutter95.headerDark,
                                  direction: isVertical
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimelineContentMobile(
      {required bool isVertical, double width = 1300, double height = 400}) {
    return Elevation95(
        type: Elevation95Type.down,
        child: Scaffold95(
            title: "Career",
            body: SingleChildScrollView(
                child: SizedBox(
              width: width,
              height: height,
              child: FixedTimeline.tileBuilder(
                builder: TimelineTileBuilder.connectedFromStyle(
                  contentsAlign: ContentsAlign.alternating,
                  oppositeContentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            getTimelineTextTitleFromIndex(index),
                            textAlign: TextAlign.center,
                            style: Flutter95.headerTextStyle
                                .copyWith(color: Flutter95.headerDark),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            getTimelineTextFromIndex(index),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  contentsBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      getImagePathFromTimelineIndex(index),
                      height: 150,
                      width: 150,
                    ),
                  ),
                  connectorStyleBuilder: (context, index) =>
                      ConnectorStyle.solidLine,
                  indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                  itemCount: 5,
                ),
                theme: TimelineThemeData(
                  color: Flutter95.headerDark,
                  direction: isVertical ? Axis.vertical : Axis.horizontal,
                ),
              ),
            ))));
  }

  void onRepoTapped() {
    js.context.callMethod('open', ['https://github.com/pelusodan/WalletGuru']);
  }

  void onAlbumTapped(Album album) {
    js.context.callMethod('open', [album.url]);
  }

  Widget buildMusicContent({double width = 400, double height = 350}) {
    final PageController musicPageController =
        PageController(initialPage: musicCurrentPage);
    return Elevation95(
        type: Elevation95Type.down,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: width,
              height: height,
              child: Scaffold95(
                  title: "Albums",
                  toolbar: null,
                  body: Expanded(
                    child: PageView(
                      onPageChanged: (page) {
                        setAlbumSlidePage(page);
                      },
                      controller: musicPageController,
                      //scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Center(
                            child: buildAlbumContent(
                                "Spider Water",
                                'assets/img/spider_water.jpg',
                                "Spider Water is a synth indie-rock collective based out of Cambridge MA. Our debut album is currently available on all streaming services.",
                                Album.spiderWater)),
                        Center(
                            child: buildAlbumContent(
                                "Common Vice",
                                'assets/img/cv.png',
                                "Common Vice is a collaborative project between myself and my good friend Adrian Duffey. I recorded drums, guitar, vocals, and bass on 10 tracks about the city college experience.",
                                Album.commonVice)),
                        Center(
                          child: buildAlbumContent(
                              "Austin",
                              'assets/img/austin.png',
                              "Austin is a solo project I worked on in the beginning of the pandemic. It was written in a weekend trip to the city with the intention of chronicling an adventure.",
                              Album.austin),
                        ),
                        Center(
                          child: buildAlbumContent(
                              "Mature",
                              'assets/img/mature.png',
                              "Mature is my first recorded project, comprised of songs I wrote from 7th grade until my freshman year of college. Most tracks are acoustic only, and tell stories about growing up.",
                              Album.mature),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }

  Widget buildProjectContent({double width = 400, double height = 330}) {
    final PageController projectSlideController =
        PageController(initialPage: projectCurrentPage);
    return Elevation95(
        type: Elevation95Type.down,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: width,
              height: height,
              child: Scaffold95(
                  title: "Projects",
                  toolbar: null,
                  body: Expanded(
                    child: Scrollbar(
                      child: PageView(
                        onPageChanged: (page) {
                          setProjectSlidePage(page);
                        },
                        controller: projectSlideController,
                        children: <Widget>[
                          Center(child: buildProjectPage(Project.walletGuru)),
                          Center(child: buildProjectPage(Project.fridgePal)),
                          Center(
                              child: buildProjectPage(
                                  Project.kanestheticLearning)),
                          Center(child: buildProjectPage(Project.missMyTrain)),
                          Center(
                              child: buildProjectPage(Project.pokemonDatabase)),
                          Center(child: buildProjectPage(Project.personalSite)),
                        ],
                      ),
                      thumbVisibility: true,
                      controller: projectSlideController,
                    ),
                  )),
            )
          ],
        ));
  }

  Widget buildPresentationContent({double width = 400, double height = 300}) {
    final PageController presentationSlideController =
        PageController(initialPage: presentationCurrentPage);
    return Elevation95(
        type: Elevation95Type.down,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: width,
              height: height,
              child: Scaffold95(
                  title: "Presentations",
                  toolbar: null,
                  body: Expanded(
                    child: Scrollbar(
                      child: PageView(
                        onPageChanged: (page) {
                          setPresentationSlidePage(page);
                        },
                        controller: presentationSlideController,
                        children: <Widget>[
                          for (var presentation in Presentation.values)
                            buildPresentationPage(presentation)
                        ],
                      ),
                      thumbVisibility: true,
                      controller: presentationSlideController,
                    ),
                  )),
            )
          ],
        ));
  }

  Widget buildAlbumContent(
      String albumName, String albumCoverPath, String body, Album album) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            onAlbumTapped(album);
          },
          child: Column(
            children: [
              Text(
                albumName,
                style: Flutter95.headerTextStyle.copyWith(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  albumCoverPath,
                  width: 150,
                  height: 150,
                ),
              ),
              Expanded(child: SizedBox.shrink()),
              Text(
                body,
                style: Flutter95.textStyle,
                textAlign: TextAlign.center,
              ),
              Expanded(child: SizedBox.shrink()),
            ],
          ),
        ));
  }

  String getImagePathFromTimelineIndex(int index) {
    switch (index) {
      case 0:
        return "assets/img/neu.png";
      case 1:
        return "assets/img/pison.png";
      case 2:
        return "assets/img/whoop.png";
      case 3:
        return "assets/img/peloton.png";
      case 4:
        return "assets/img/klaviyo.png";
      default:
        return "assets/img/austin.png";
    }
  }

  String getTimelineTextFromIndex(int index) {
    switch (index) {
      case 0:
        return "- Computer Engineering \n- Computer Science";
      case 1:
        return "- Developed data collection app for Android \n- Refactored Unity app to Android for ALS patients\n- Built new consumer facing device interface using \n  Compose and KMP";
      case 2:
        return "- Smart Alarm sleep planning system\n- Maintained testing pipeline \n  and improved internal architecture\n- Used clean architecture with Compose \n  and Coroutines for the sleep details screen";
      case 3:
        return "- Improved commercial device experience\n- Established Jetpack Compose infrastructure \n  and initial scoping\n- Removed and replaced legacy code flows \n  for the Peloton tablet with modern MVVM";
      case 4:
        return "- Working on the Push Notification SDK team!";
      default:
        return "ah fuck";
    }
  }

  String getTimelineTextTitleFromIndex(int index) {
    switch (index) {
      case 0:
        return "2017-2021";
      case 1:
        return "2019-2021";
      case 2:
        return "2020-2022";
      case 3:
        return "2022-2024";
      case 4:
        return "2024-";
      default:
        return "ah fuck";
    }
  }

  Widget buildProjectPage(Project project) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            onUrlTapped(project.repoLink);
          },
          child: Column(
            children: [
              Text(
                project.title,
                textAlign: TextAlign.center,
                style: Flutter95.headerTextStyle.copyWith(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  project.imgPath,
                  width: 150,
                  height: 150,
                ),
              ),
              Text(
                project.body,
                textAlign: TextAlign.center,
                style: Flutter95.textStyle,
              )
            ],
          ),
        ));
  }

  Widget buildPresentationPage(Presentation presentation) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          if (presentation.link != null) {
            onUrlTapped(presentation.link!);
          }
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                presentation.title,
                textAlign: TextAlign.center,
                style: Flutter95.headerTextStyle.copyWith(color: Colors.black),
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (presentation.imgPath != null)
                  Image.asset(
                    presentation.imgPath!,
                  ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        presentation.body,
                        textAlign: TextAlign.left,
                        style:
                            Flutter95.textStyle.copyWith(color: Colors.black),
                      ),
                      Text(
                        presentation.conferences.reduce(
                            (value, element) => "- " + value + "\n- $element"),
                        textAlign: TextAlign.left,
                        style:
                            Flutter95.textStyle.copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ))
              ],
            )),
          ],
        ),
      ),
    );
  }

  void onUrlTapped(String repoLink) {
    js.context.callMethod('open', [repoLink]);
  }

  Widget buildDesktopPage(double screenWidth, double screenHeight) {
    return Container(
        width: screenWidth,
        height: screenHeight - verticalOffset,
        child: GestureDetector(
          onScaleUpdate: (details) => updateScale(details.scale),
          onScaleEnd: (_) => commitScale(),
          child: Stack(
              children: windowIds
                  .map((e) => generateWidgetFromId(e, context))
                  .toList()),
        ));
  }

  Widget buildMobilePage(double screenWidth, double screenHeight) {
    return Container(
      color: Flutter95.secondary,
      width: screenWidth,
      height: screenHeight - 80,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Flutter95.secondary,
          )),
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                daffyEnabled
                    ? buildDaffyContent(width: screenWidth)
                    : const SizedBox.shrink(),
                daffyEnabled
                    ? const SizedBox(height: 20)
                    : const SizedBox.shrink(),
                buildAboutWindowContent(
                  width: screenWidth,
                ),
                const SizedBox(height: 20),
                buildPresentationContent(
                  width: screenWidth,
                ),
                const SizedBox(height: 20),
                buildTimelineContentMobile(
                    isVertical: true, width: screenWidth, height: 1400),
                const SizedBox(height: 20),
                buildTechContent(width: screenWidth, height: 450),
                const SizedBox(height: 20),
                buildProjectContent(
                  width: screenWidth,
                ),
                const SizedBox(height: 20),
                buildContactMeContent(width: screenWidth),
                const SizedBox(height: 20),
                buildMusicContent(width: screenWidth, height: 350),
              ],
            ),
          )
        ],
      ),
    );
  }

  Route scaleBuilder() {
    return ScaleRoute(page: const Resume());
  }
}
