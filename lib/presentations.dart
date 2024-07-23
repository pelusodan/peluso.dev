enum Presentation {
  /*androidMentors(
    "The Critical Need for More Android Mentors",
    "A brief history of mobile development as a career and a guide to mentorship in the space",
    null,
    null,
    ["scheduled Droidcon NYC 2024"]
  ),*/
  moduleMayhem(
      "Module Mayhem: Tales from Shared Business Logic",
      "Shared stories of enterprise module code refactors and highlighted solutions to common code sharing issues",
      "assets/img/droidcon2.jpg",
      "https://www.droidcon.com/2024/07/17/module-mayhem-tales-from-shared-business-logic/",
      ["Droidcon SF 2024"]),
  composeInteroperability(
      "Compose Interoperability in a Legacy Codebase",
      "Discussed the path to using Compose in coordination with XML at a large scale company.",
      "assets/img/droidcon.jpg",
      "https://www.droidcon.com/2023/10/06/coupling-compose-interoperability-in-a-legacy-codebase/",
      ["Droidcon NYC 2023"]),
  flutterWebsite(
      "Flutter Web: Building and Maintaining a Public Web App",
      "How to create a unique Flutter portfolio and use Github pages + actions to create CI for your project",
      "assets/img/flutterWeb.jpg",
      "https://gdg.community.dev/events/details/google-gdg-boston-android-presents-devfest-boston-2023-1/cohost-gdg-boston-android",
      ["DevFest 2023 UMass Boston", "DevFest 2023 Boston"]);

  const Presentation(
      this.title, this.body, this.imgPath, this.link, this.conferences);

  final String title;
  final String body;
  final String? imgPath;
  final String? link;
  final List<String> conferences;
}
